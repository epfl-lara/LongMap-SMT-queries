; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35760 () Bool)

(assert start!35760)

(declare-fun b!359079 () Bool)

(declare-fun e!219905 () Bool)

(declare-fun tp_is_empty!8227 () Bool)

(assert (=> b!359079 (= e!219905 tp_is_empty!8227)))

(declare-fun b!359080 () Bool)

(declare-fun e!219902 () Bool)

(declare-fun mapRes!13848 () Bool)

(assert (=> b!359080 (= e!219902 (and e!219905 mapRes!13848))))

(declare-fun condMapEmpty!13848 () Bool)

(declare-datatypes ((V!11947 0))(
  ( (V!11948 (val!4158 Int)) )
))
(declare-datatypes ((ValueCell!3770 0))(
  ( (ValueCellFull!3770 (v!6346 V!11947)) (EmptyCell!3770) )
))
(declare-datatypes ((array!19987 0))(
  ( (array!19988 (arr!9487 (Array (_ BitVec 32) ValueCell!3770)) (size!9840 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19987)

(declare-fun mapDefault!13848 () ValueCell!3770)

(assert (=> b!359080 (= condMapEmpty!13848 (= (arr!9487 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3770)) mapDefault!13848)))))

(declare-fun res!199608 () Bool)

(declare-fun e!219904 () Bool)

(assert (=> start!35760 (=> (not res!199608) (not e!219904))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35760 (= res!199608 (validMask!0 mask!1842))))

(assert (=> start!35760 e!219904))

(assert (=> start!35760 true))

(declare-fun array_inv!7004 (array!19987) Bool)

(assert (=> start!35760 (and (array_inv!7004 _values!1208) e!219902)))

(declare-datatypes ((array!19989 0))(
  ( (array!19990 (arr!9488 (Array (_ BitVec 32) (_ BitVec 64))) (size!9841 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19989)

(declare-fun array_inv!7005 (array!19989) Bool)

(assert (=> start!35760 (array_inv!7005 _keys!1456)))

(declare-fun mapIsEmpty!13848 () Bool)

(assert (=> mapIsEmpty!13848 mapRes!13848))

(declare-fun mapNonEmpty!13848 () Bool)

(declare-fun tp!27915 () Bool)

(declare-fun e!219906 () Bool)

(assert (=> mapNonEmpty!13848 (= mapRes!13848 (and tp!27915 e!219906))))

(declare-fun mapValue!13848 () ValueCell!3770)

(declare-fun mapKey!13848 () (_ BitVec 32))

(declare-fun mapRest!13848 () (Array (_ BitVec 32) ValueCell!3770))

(assert (=> mapNonEmpty!13848 (= (arr!9487 _values!1208) (store mapRest!13848 mapKey!13848 mapValue!13848))))

(declare-fun b!359081 () Bool)

(declare-fun res!199609 () Bool)

(assert (=> b!359081 (=> (not res!199609) (not e!219904))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359081 (= res!199609 (and (= (size!9840 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9841 _keys!1456) (size!9840 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359082 () Bool)

(assert (=> b!359082 (= e!219906 tp_is_empty!8227)))

(declare-fun b!359083 () Bool)

(assert (=> b!359083 (= e!219904 false)))

(declare-fun lt!166093 () Bool)

(declare-datatypes ((List!5428 0))(
  ( (Nil!5425) (Cons!5424 (h!6280 (_ BitVec 64)) (t!10569 List!5428)) )
))
(declare-fun arrayNoDuplicates!0 (array!19989 (_ BitVec 32) List!5428) Bool)

(assert (=> b!359083 (= lt!166093 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5425))))

(declare-fun b!359084 () Bool)

(declare-fun res!199607 () Bool)

(assert (=> b!359084 (=> (not res!199607) (not e!219904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19989 (_ BitVec 32)) Bool)

(assert (=> b!359084 (= res!199607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35760 res!199608) b!359081))

(assert (= (and b!359081 res!199609) b!359084))

(assert (= (and b!359084 res!199607) b!359083))

(assert (= (and b!359080 condMapEmpty!13848) mapIsEmpty!13848))

(assert (= (and b!359080 (not condMapEmpty!13848)) mapNonEmpty!13848))

(get-info :version)

(assert (= (and mapNonEmpty!13848 ((_ is ValueCellFull!3770) mapValue!13848)) b!359082))

(assert (= (and b!359080 ((_ is ValueCellFull!3770) mapDefault!13848)) b!359079))

(assert (= start!35760 b!359080))

(declare-fun m!356157 () Bool)

(assert (=> start!35760 m!356157))

(declare-fun m!356159 () Bool)

(assert (=> start!35760 m!356159))

(declare-fun m!356161 () Bool)

(assert (=> start!35760 m!356161))

(declare-fun m!356163 () Bool)

(assert (=> mapNonEmpty!13848 m!356163))

(declare-fun m!356165 () Bool)

(assert (=> b!359083 m!356165))

(declare-fun m!356167 () Bool)

(assert (=> b!359084 m!356167))

(check-sat (not b!359084) tp_is_empty!8227 (not mapNonEmpty!13848) (not b!359083) (not start!35760))
(check-sat)
