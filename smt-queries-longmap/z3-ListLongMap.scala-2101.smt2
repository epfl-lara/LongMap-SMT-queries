; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35760 () Bool)

(assert start!35760)

(declare-fun b!359301 () Bool)

(declare-fun e!220047 () Bool)

(declare-fun tp_is_empty!8227 () Bool)

(assert (=> b!359301 (= e!220047 tp_is_empty!8227)))

(declare-fun mapNonEmpty!13848 () Bool)

(declare-fun mapRes!13848 () Bool)

(declare-fun tp!27915 () Bool)

(assert (=> mapNonEmpty!13848 (= mapRes!13848 (and tp!27915 e!220047))))

(declare-fun mapKey!13848 () (_ BitVec 32))

(declare-datatypes ((V!11947 0))(
  ( (V!11948 (val!4158 Int)) )
))
(declare-datatypes ((ValueCell!3770 0))(
  ( (ValueCellFull!3770 (v!6353 V!11947)) (EmptyCell!3770) )
))
(declare-fun mapRest!13848 () (Array (_ BitVec 32) ValueCell!3770))

(declare-datatypes ((array!19990 0))(
  ( (array!19991 (arr!9488 (Array (_ BitVec 32) ValueCell!3770)) (size!9840 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19990)

(declare-fun mapValue!13848 () ValueCell!3770)

(assert (=> mapNonEmpty!13848 (= (arr!9488 _values!1208) (store mapRest!13848 mapKey!13848 mapValue!13848))))

(declare-fun b!359302 () Bool)

(declare-fun e!220046 () Bool)

(assert (=> b!359302 (= e!220046 false)))

(declare-fun lt!166346 () Bool)

(declare-datatypes ((array!19992 0))(
  ( (array!19993 (arr!9489 (Array (_ BitVec 32) (_ BitVec 64))) (size!9841 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19992)

(declare-datatypes ((List!5373 0))(
  ( (Nil!5370) (Cons!5369 (h!6225 (_ BitVec 64)) (t!10515 List!5373)) )
))
(declare-fun arrayNoDuplicates!0 (array!19992 (_ BitVec 32) List!5373) Bool)

(assert (=> b!359302 (= lt!166346 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5370))))

(declare-fun b!359303 () Bool)

(declare-fun res!199734 () Bool)

(assert (=> b!359303 (=> (not res!199734) (not e!220046))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!359303 (= res!199734 (and (= (size!9840 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9841 _keys!1456) (size!9840 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!199735 () Bool)

(assert (=> start!35760 (=> (not res!199735) (not e!220046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35760 (= res!199735 (validMask!0 mask!1842))))

(assert (=> start!35760 e!220046))

(assert (=> start!35760 true))

(declare-fun e!220045 () Bool)

(declare-fun array_inv!7014 (array!19990) Bool)

(assert (=> start!35760 (and (array_inv!7014 _values!1208) e!220045)))

(declare-fun array_inv!7015 (array!19992) Bool)

(assert (=> start!35760 (array_inv!7015 _keys!1456)))

(declare-fun b!359304 () Bool)

(declare-fun e!220048 () Bool)

(assert (=> b!359304 (= e!220045 (and e!220048 mapRes!13848))))

(declare-fun condMapEmpty!13848 () Bool)

(declare-fun mapDefault!13848 () ValueCell!3770)

(assert (=> b!359304 (= condMapEmpty!13848 (= (arr!9488 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3770)) mapDefault!13848)))))

(declare-fun mapIsEmpty!13848 () Bool)

(assert (=> mapIsEmpty!13848 mapRes!13848))

(declare-fun b!359305 () Bool)

(assert (=> b!359305 (= e!220048 tp_is_empty!8227)))

(declare-fun b!359306 () Bool)

(declare-fun res!199733 () Bool)

(assert (=> b!359306 (=> (not res!199733) (not e!220046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19992 (_ BitVec 32)) Bool)

(assert (=> b!359306 (= res!199733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35760 res!199735) b!359303))

(assert (= (and b!359303 res!199734) b!359306))

(assert (= (and b!359306 res!199733) b!359302))

(assert (= (and b!359304 condMapEmpty!13848) mapIsEmpty!13848))

(assert (= (and b!359304 (not condMapEmpty!13848)) mapNonEmpty!13848))

(get-info :version)

(assert (= (and mapNonEmpty!13848 ((_ is ValueCellFull!3770) mapValue!13848)) b!359301))

(assert (= (and b!359304 ((_ is ValueCellFull!3770) mapDefault!13848)) b!359305))

(assert (= start!35760 b!359304))

(declare-fun m!357111 () Bool)

(assert (=> mapNonEmpty!13848 m!357111))

(declare-fun m!357113 () Bool)

(assert (=> b!359302 m!357113))

(declare-fun m!357115 () Bool)

(assert (=> start!35760 m!357115))

(declare-fun m!357117 () Bool)

(assert (=> start!35760 m!357117))

(declare-fun m!357119 () Bool)

(assert (=> start!35760 m!357119))

(declare-fun m!357121 () Bool)

(assert (=> b!359306 m!357121))

(check-sat (not b!359306) tp_is_empty!8227 (not mapNonEmpty!13848) (not b!359302) (not start!35760))
(check-sat)
