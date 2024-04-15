; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35748 () Bool)

(assert start!35748)

(declare-fun b!358971 () Bool)

(declare-fun e!219815 () Bool)

(declare-fun e!219816 () Bool)

(declare-fun mapRes!13830 () Bool)

(assert (=> b!358971 (= e!219815 (and e!219816 mapRes!13830))))

(declare-fun condMapEmpty!13830 () Bool)

(declare-datatypes ((V!11931 0))(
  ( (V!11932 (val!4152 Int)) )
))
(declare-datatypes ((ValueCell!3764 0))(
  ( (ValueCellFull!3764 (v!6340 V!11931)) (EmptyCell!3764) )
))
(declare-datatypes ((array!19965 0))(
  ( (array!19966 (arr!9476 (Array (_ BitVec 32) ValueCell!3764)) (size!9829 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19965)

(declare-fun mapDefault!13830 () ValueCell!3764)

(assert (=> b!358971 (= condMapEmpty!13830 (= (arr!9476 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3764)) mapDefault!13830)))))

(declare-fun b!358972 () Bool)

(declare-fun e!219813 () Bool)

(declare-fun tp_is_empty!8215 () Bool)

(assert (=> b!358972 (= e!219813 tp_is_empty!8215)))

(declare-fun b!358973 () Bool)

(declare-fun res!199553 () Bool)

(declare-fun e!219814 () Bool)

(assert (=> b!358973 (=> (not res!199553) (not e!219814))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19967 0))(
  ( (array!19968 (arr!9477 (Array (_ BitVec 32) (_ BitVec 64))) (size!9830 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19967)

(assert (=> b!358973 (= res!199553 (and (= (size!9829 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9830 _keys!1456) (size!9829 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358974 () Bool)

(assert (=> b!358974 (= e!219814 false)))

(declare-fun lt!166075 () Bool)

(declare-datatypes ((List!5424 0))(
  ( (Nil!5421) (Cons!5420 (h!6276 (_ BitVec 64)) (t!10565 List!5424)) )
))
(declare-fun arrayNoDuplicates!0 (array!19967 (_ BitVec 32) List!5424) Bool)

(assert (=> b!358974 (= lt!166075 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5421))))

(declare-fun res!199555 () Bool)

(assert (=> start!35748 (=> (not res!199555) (not e!219814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35748 (= res!199555 (validMask!0 mask!1842))))

(assert (=> start!35748 e!219814))

(assert (=> start!35748 true))

(declare-fun array_inv!6994 (array!19965) Bool)

(assert (=> start!35748 (and (array_inv!6994 _values!1208) e!219815)))

(declare-fun array_inv!6995 (array!19967) Bool)

(assert (=> start!35748 (array_inv!6995 _keys!1456)))

(declare-fun b!358975 () Bool)

(assert (=> b!358975 (= e!219816 tp_is_empty!8215)))

(declare-fun mapIsEmpty!13830 () Bool)

(assert (=> mapIsEmpty!13830 mapRes!13830))

(declare-fun b!358976 () Bool)

(declare-fun res!199554 () Bool)

(assert (=> b!358976 (=> (not res!199554) (not e!219814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19967 (_ BitVec 32)) Bool)

(assert (=> b!358976 (= res!199554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13830 () Bool)

(declare-fun tp!27897 () Bool)

(assert (=> mapNonEmpty!13830 (= mapRes!13830 (and tp!27897 e!219813))))

(declare-fun mapRest!13830 () (Array (_ BitVec 32) ValueCell!3764))

(declare-fun mapKey!13830 () (_ BitVec 32))

(declare-fun mapValue!13830 () ValueCell!3764)

(assert (=> mapNonEmpty!13830 (= (arr!9476 _values!1208) (store mapRest!13830 mapKey!13830 mapValue!13830))))

(assert (= (and start!35748 res!199555) b!358973))

(assert (= (and b!358973 res!199553) b!358976))

(assert (= (and b!358976 res!199554) b!358974))

(assert (= (and b!358971 condMapEmpty!13830) mapIsEmpty!13830))

(assert (= (and b!358971 (not condMapEmpty!13830)) mapNonEmpty!13830))

(get-info :version)

(assert (= (and mapNonEmpty!13830 ((_ is ValueCellFull!3764) mapValue!13830)) b!358972))

(assert (= (and b!358971 ((_ is ValueCellFull!3764) mapDefault!13830)) b!358975))

(assert (= start!35748 b!358971))

(declare-fun m!356085 () Bool)

(assert (=> b!358974 m!356085))

(declare-fun m!356087 () Bool)

(assert (=> start!35748 m!356087))

(declare-fun m!356089 () Bool)

(assert (=> start!35748 m!356089))

(declare-fun m!356091 () Bool)

(assert (=> start!35748 m!356091))

(declare-fun m!356093 () Bool)

(assert (=> b!358976 m!356093))

(declare-fun m!356095 () Bool)

(assert (=> mapNonEmpty!13830 m!356095))

(check-sat (not start!35748) tp_is_empty!8215 (not b!358976) (not b!358974) (not mapNonEmpty!13830))
(check-sat)
