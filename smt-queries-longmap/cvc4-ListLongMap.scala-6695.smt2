; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84146 () Bool)

(assert start!84146)

(declare-fun b_free!19847 () Bool)

(declare-fun b_next!19847 () Bool)

(assert (=> start!84146 (= b_free!19847 (not b_next!19847))))

(declare-fun tp!69144 () Bool)

(declare-fun b_and!31773 () Bool)

(assert (=> start!84146 (= tp!69144 b_and!31773)))

(declare-fun b!983865 () Bool)

(declare-fun e!554667 () Bool)

(declare-fun tp_is_empty!22949 () Bool)

(assert (=> b!983865 (= e!554667 tp_is_empty!22949)))

(declare-fun b!983866 () Bool)

(declare-fun res!658337 () Bool)

(declare-fun e!554668 () Bool)

(assert (=> b!983866 (=> (not res!658337) (not e!554668))))

(declare-datatypes ((array!61881 0))(
  ( (array!61882 (arr!29798 (Array (_ BitVec 32) (_ BitVec 64))) (size!30277 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61881)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61881 (_ BitVec 32)) Bool)

(assert (=> b!983866 (= res!658337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983867 () Bool)

(declare-fun res!658340 () Bool)

(assert (=> b!983867 (=> (not res!658340) (not e!554668))))

(declare-datatypes ((List!20628 0))(
  ( (Nil!20625) (Cons!20624 (h!21786 (_ BitVec 64)) (t!29419 List!20628)) )
))
(declare-fun arrayNoDuplicates!0 (array!61881 (_ BitVec 32) List!20628) Bool)

(assert (=> b!983867 (= res!658340 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20625))))

(declare-fun mapIsEmpty!36452 () Bool)

(declare-fun mapRes!36452 () Bool)

(assert (=> mapIsEmpty!36452 mapRes!36452))

(declare-fun b!983868 () Bool)

(declare-fun res!658341 () Bool)

(assert (=> b!983868 (=> (not res!658341) (not e!554668))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983868 (= res!658341 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30277 _keys!1544))))))

(declare-fun b!983869 () Bool)

(assert (=> b!983869 (= e!554668 false)))

(declare-datatypes ((V!35581 0))(
  ( (V!35582 (val!11525 Int)) )
))
(declare-fun minValue!1220 () V!35581)

(declare-datatypes ((ValueCell!10993 0))(
  ( (ValueCellFull!10993 (v!14087 V!35581)) (EmptyCell!10993) )
))
(declare-datatypes ((array!61883 0))(
  ( (array!61884 (arr!29799 (Array (_ BitVec 32) ValueCell!10993)) (size!30278 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61883)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14736 0))(
  ( (tuple2!14737 (_1!7379 (_ BitVec 64)) (_2!7379 V!35581)) )
))
(declare-datatypes ((List!20629 0))(
  ( (Nil!20626) (Cons!20625 (h!21787 tuple2!14736) (t!29420 List!20629)) )
))
(declare-datatypes ((ListLongMap!13433 0))(
  ( (ListLongMap!13434 (toList!6732 List!20629)) )
))
(declare-fun lt!436571 () ListLongMap!13433)

(declare-fun zeroValue!1220 () V!35581)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3427 (array!61881 array!61883 (_ BitVec 32) (_ BitVec 32) V!35581 V!35581 (_ BitVec 32) Int) ListLongMap!13433)

(assert (=> b!983869 (= lt!436571 (getCurrentListMapNoExtraKeys!3427 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983870 () Bool)

(declare-fun res!658338 () Bool)

(assert (=> b!983870 (=> (not res!658338) (not e!554668))))

(assert (=> b!983870 (= res!658338 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!983871 () Bool)

(declare-fun res!658342 () Bool)

(assert (=> b!983871 (=> (not res!658342) (not e!554668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983871 (= res!658342 (validKeyInArray!0 (select (arr!29798 _keys!1544) from!1932)))))

(declare-fun res!658343 () Bool)

(assert (=> start!84146 (=> (not res!658343) (not e!554668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84146 (= res!658343 (validMask!0 mask!1948))))

(assert (=> start!84146 e!554668))

(assert (=> start!84146 true))

(assert (=> start!84146 tp_is_empty!22949))

(declare-fun e!554666 () Bool)

(declare-fun array_inv!23041 (array!61883) Bool)

(assert (=> start!84146 (and (array_inv!23041 _values!1278) e!554666)))

(assert (=> start!84146 tp!69144))

(declare-fun array_inv!23042 (array!61881) Bool)

(assert (=> start!84146 (array_inv!23042 _keys!1544)))

(declare-fun b!983872 () Bool)

(declare-fun res!658339 () Bool)

(assert (=> b!983872 (=> (not res!658339) (not e!554668))))

(assert (=> b!983872 (= res!658339 (and (= (size!30278 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30277 _keys!1544) (size!30278 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983873 () Bool)

(assert (=> b!983873 (= e!554666 (and e!554667 mapRes!36452))))

(declare-fun condMapEmpty!36452 () Bool)

(declare-fun mapDefault!36452 () ValueCell!10993)

