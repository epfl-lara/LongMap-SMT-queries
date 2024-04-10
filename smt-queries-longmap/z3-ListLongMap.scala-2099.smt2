; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35764 () Bool)

(assert start!35764)

(declare-fun b!359264 () Bool)

(declare-fun e!220006 () Bool)

(declare-fun tp_is_empty!8217 () Bool)

(assert (=> b!359264 (= e!220006 tp_is_empty!8217)))

(declare-fun res!199691 () Bool)

(declare-fun e!220004 () Bool)

(assert (=> start!35764 (=> (not res!199691) (not e!220004))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35764 (= res!199691 (validMask!0 mask!1842))))

(assert (=> start!35764 e!220004))

(assert (=> start!35764 true))

(declare-datatypes ((V!11933 0))(
  ( (V!11934 (val!4153 Int)) )
))
(declare-datatypes ((ValueCell!3765 0))(
  ( (ValueCellFull!3765 (v!6347 V!11933)) (EmptyCell!3765) )
))
(declare-datatypes ((array!19993 0))(
  ( (array!19994 (arr!9490 (Array (_ BitVec 32) ValueCell!3765)) (size!9842 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19993)

(declare-fun e!220005 () Bool)

(declare-fun array_inv!6982 (array!19993) Bool)

(assert (=> start!35764 (and (array_inv!6982 _values!1208) e!220005)))

(declare-datatypes ((array!19995 0))(
  ( (array!19996 (arr!9491 (Array (_ BitVec 32) (_ BitVec 64))) (size!9843 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19995)

(declare-fun array_inv!6983 (array!19995) Bool)

(assert (=> start!35764 (array_inv!6983 _keys!1456)))

(declare-fun b!359265 () Bool)

(declare-fun e!220007 () Bool)

(assert (=> b!359265 (= e!220007 tp_is_empty!8217)))

(declare-fun b!359266 () Bool)

(assert (=> b!359266 (= e!220004 false)))

(declare-fun lt!166313 () Bool)

(declare-datatypes ((List!5461 0))(
  ( (Nil!5458) (Cons!5457 (h!6313 (_ BitVec 64)) (t!10611 List!5461)) )
))
(declare-fun arrayNoDuplicates!0 (array!19995 (_ BitVec 32) List!5461) Bool)

(assert (=> b!359266 (= lt!166313 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5458))))

(declare-fun mapIsEmpty!13833 () Bool)

(declare-fun mapRes!13833 () Bool)

(assert (=> mapIsEmpty!13833 mapRes!13833))

(declare-fun b!359267 () Bool)

(assert (=> b!359267 (= e!220005 (and e!220006 mapRes!13833))))

(declare-fun condMapEmpty!13833 () Bool)

(declare-fun mapDefault!13833 () ValueCell!3765)

(assert (=> b!359267 (= condMapEmpty!13833 (= (arr!9490 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3765)) mapDefault!13833)))))

(declare-fun b!359268 () Bool)

(declare-fun res!199693 () Bool)

(assert (=> b!359268 (=> (not res!199693) (not e!220004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19995 (_ BitVec 32)) Bool)

(assert (=> b!359268 (= res!199693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359269 () Bool)

(declare-fun res!199692 () Bool)

(assert (=> b!359269 (=> (not res!199692) (not e!220004))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359269 (= res!199692 (and (= (size!9842 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9843 _keys!1456) (size!9842 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13833 () Bool)

(declare-fun tp!27900 () Bool)

(assert (=> mapNonEmpty!13833 (= mapRes!13833 (and tp!27900 e!220007))))

(declare-fun mapKey!13833 () (_ BitVec 32))

(declare-fun mapValue!13833 () ValueCell!3765)

(declare-fun mapRest!13833 () (Array (_ BitVec 32) ValueCell!3765))

(assert (=> mapNonEmpty!13833 (= (arr!9490 _values!1208) (store mapRest!13833 mapKey!13833 mapValue!13833))))

(assert (= (and start!35764 res!199691) b!359269))

(assert (= (and b!359269 res!199692) b!359268))

(assert (= (and b!359268 res!199693) b!359266))

(assert (= (and b!359267 condMapEmpty!13833) mapIsEmpty!13833))

(assert (= (and b!359267 (not condMapEmpty!13833)) mapNonEmpty!13833))

(get-info :version)

(assert (= (and mapNonEmpty!13833 ((_ is ValueCellFull!3765) mapValue!13833)) b!359265))

(assert (= (and b!359267 ((_ is ValueCellFull!3765) mapDefault!13833)) b!359264))

(assert (= start!35764 b!359267))

(declare-fun m!356827 () Bool)

(assert (=> start!35764 m!356827))

(declare-fun m!356829 () Bool)

(assert (=> start!35764 m!356829))

(declare-fun m!356831 () Bool)

(assert (=> start!35764 m!356831))

(declare-fun m!356833 () Bool)

(assert (=> b!359266 m!356833))

(declare-fun m!356835 () Bool)

(assert (=> b!359268 m!356835))

(declare-fun m!356837 () Bool)

(assert (=> mapNonEmpty!13833 m!356837))

(check-sat (not start!35764) (not mapNonEmpty!13833) (not b!359266) tp_is_empty!8217 (not b!359268))
(check-sat)
