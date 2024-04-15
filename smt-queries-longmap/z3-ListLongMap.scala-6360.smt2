; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81878 () Bool)

(assert start!81878)

(declare-fun b_free!18391 () Bool)

(declare-fun b_next!18391 () Bool)

(assert (=> start!81878 (= b_free!18391 (not b_next!18391))))

(declare-fun tp!63874 () Bool)

(declare-fun b_and!29851 () Bool)

(assert (=> start!81878 (= tp!63874 b_and!29851)))

(declare-fun mapIsEmpty!33364 () Bool)

(declare-fun mapRes!33364 () Bool)

(assert (=> mapIsEmpty!33364 mapRes!33364))

(declare-fun mapNonEmpty!33364 () Bool)

(declare-fun tp!63873 () Bool)

(declare-fun e!537973 () Bool)

(assert (=> mapNonEmpty!33364 (= mapRes!33364 (and tp!63873 e!537973))))

(declare-datatypes ((V!32897 0))(
  ( (V!32898 (val!10518 Int)) )
))
(declare-datatypes ((ValueCell!9986 0))(
  ( (ValueCellFull!9986 (v!13072 V!32897)) (EmptyCell!9986) )
))
(declare-fun mapValue!33364 () ValueCell!9986)

(declare-fun mapKey!33364 () (_ BitVec 32))

(declare-datatypes ((array!57936 0))(
  ( (array!57937 (arr!27848 (Array (_ BitVec 32) ValueCell!9986)) (size!28329 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57936)

(declare-fun mapRest!33364 () (Array (_ BitVec 32) ValueCell!9986))

(assert (=> mapNonEmpty!33364 (= (arr!27848 _values!1197) (store mapRest!33364 mapKey!33364 mapValue!33364))))

(declare-fun b!954928 () Bool)

(declare-fun res!639520 () Bool)

(declare-fun e!537975 () Bool)

(assert (=> b!954928 (=> (not res!639520) (not e!537975))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!57938 0))(
  ( (array!57939 (arr!27849 (Array (_ BitVec 32) (_ BitVec 64))) (size!28330 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57938)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!954928 (= res!639520 (and (= (size!28329 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28330 _keys!1441) (size!28329 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954929 () Bool)

(declare-fun res!639519 () Bool)

(assert (=> b!954929 (=> (not res!639519) (not e!537975))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!954929 (= res!639519 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28330 _keys!1441))))))

(declare-fun res!639518 () Bool)

(assert (=> start!81878 (=> (not res!639518) (not e!537975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81878 (= res!639518 (validMask!0 mask!1823))))

(assert (=> start!81878 e!537975))

(assert (=> start!81878 true))

(declare-fun tp_is_empty!20935 () Bool)

(assert (=> start!81878 tp_is_empty!20935))

(declare-fun array_inv!21675 (array!57938) Bool)

(assert (=> start!81878 (array_inv!21675 _keys!1441)))

(declare-fun e!537971 () Bool)

(declare-fun array_inv!21676 (array!57936) Bool)

(assert (=> start!81878 (and (array_inv!21676 _values!1197) e!537971)))

(assert (=> start!81878 tp!63874))

(declare-fun b!954930 () Bool)

(assert (=> b!954930 (= e!537973 tp_is_empty!20935)))

(declare-fun b!954931 () Bool)

(declare-fun e!537972 () Bool)

(assert (=> b!954931 (= e!537972 tp_is_empty!20935)))

(declare-fun b!954932 () Bool)

(declare-fun res!639514 () Bool)

(assert (=> b!954932 (=> (not res!639514) (not e!537975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954932 (= res!639514 (validKeyInArray!0 (select (arr!27849 _keys!1441) i!735)))))

(declare-fun b!954933 () Bool)

(assert (=> b!954933 (= e!537971 (and e!537972 mapRes!33364))))

(declare-fun condMapEmpty!33364 () Bool)

(declare-fun mapDefault!33364 () ValueCell!9986)

(assert (=> b!954933 (= condMapEmpty!33364 (= (arr!27848 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9986)) mapDefault!33364)))))

(declare-fun b!954934 () Bool)

(declare-fun res!639517 () Bool)

(assert (=> b!954934 (=> (not res!639517) (not e!537975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57938 (_ BitVec 32)) Bool)

(assert (=> b!954934 (= res!639517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954935 () Bool)

(assert (=> b!954935 (= e!537975 (not true))))

(declare-fun zeroValue!1139 () V!32897)

(declare-fun minValue!1139 () V!32897)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13698 0))(
  ( (tuple2!13699 (_1!6860 (_ BitVec 64)) (_2!6860 V!32897)) )
))
(declare-datatypes ((List!19438 0))(
  ( (Nil!19435) (Cons!19434 (h!20596 tuple2!13698) (t!27790 List!19438)) )
))
(declare-datatypes ((ListLongMap!12385 0))(
  ( (ListLongMap!12386 (toList!6208 List!19438)) )
))
(declare-fun contains!5249 (ListLongMap!12385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3370 (array!57938 array!57936 (_ BitVec 32) (_ BitVec 32) V!32897 V!32897 (_ BitVec 32) Int) ListLongMap!12385)

(assert (=> b!954935 (contains!5249 (getCurrentListMap!3370 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27849 _keys!1441) i!735))))

(declare-datatypes ((Unit!31966 0))(
  ( (Unit!31967) )
))
(declare-fun lt!429744 () Unit!31966)

(declare-fun lemmaInListMapFromThenFromZero!2 (array!57938 array!57936 (_ BitVec 32) (_ BitVec 32) V!32897 V!32897 (_ BitVec 32) (_ BitVec 32) Int) Unit!31966)

(assert (=> b!954935 (= lt!429744 (lemmaInListMapFromThenFromZero!2 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!954936 () Bool)

(declare-fun res!639516 () Bool)

(assert (=> b!954936 (=> (not res!639516) (not e!537975))))

(declare-datatypes ((List!19439 0))(
  ( (Nil!19436) (Cons!19435 (h!20597 (_ BitVec 64)) (t!27791 List!19439)) )
))
(declare-fun arrayNoDuplicates!0 (array!57938 (_ BitVec 32) List!19439) Bool)

(assert (=> b!954936 (= res!639516 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19436))))

(declare-fun b!954937 () Bool)

(declare-fun res!639515 () Bool)

(assert (=> b!954937 (=> (not res!639515) (not e!537975))))

(assert (=> b!954937 (= res!639515 (contains!5249 (getCurrentListMap!3370 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27849 _keys!1441) i!735)))))

(assert (= (and start!81878 res!639518) b!954928))

(assert (= (and b!954928 res!639520) b!954934))

(assert (= (and b!954934 res!639517) b!954936))

(assert (= (and b!954936 res!639516) b!954929))

(assert (= (and b!954929 res!639519) b!954932))

(assert (= (and b!954932 res!639514) b!954937))

(assert (= (and b!954937 res!639515) b!954935))

(assert (= (and b!954933 condMapEmpty!33364) mapIsEmpty!33364))

(assert (= (and b!954933 (not condMapEmpty!33364)) mapNonEmpty!33364))

(get-info :version)

(assert (= (and mapNonEmpty!33364 ((_ is ValueCellFull!9986) mapValue!33364)) b!954930))

(assert (= (and b!954933 ((_ is ValueCellFull!9986) mapDefault!33364)) b!954931))

(assert (= start!81878 b!954933))

(declare-fun m!885963 () Bool)

(assert (=> b!954937 m!885963))

(declare-fun m!885965 () Bool)

(assert (=> b!954937 m!885965))

(assert (=> b!954937 m!885963))

(assert (=> b!954937 m!885965))

(declare-fun m!885967 () Bool)

(assert (=> b!954937 m!885967))

(declare-fun m!885969 () Bool)

(assert (=> mapNonEmpty!33364 m!885969))

(declare-fun m!885971 () Bool)

(assert (=> start!81878 m!885971))

(declare-fun m!885973 () Bool)

(assert (=> start!81878 m!885973))

(declare-fun m!885975 () Bool)

(assert (=> start!81878 m!885975))

(declare-fun m!885977 () Bool)

(assert (=> b!954935 m!885977))

(assert (=> b!954935 m!885965))

(assert (=> b!954935 m!885977))

(assert (=> b!954935 m!885965))

(declare-fun m!885979 () Bool)

(assert (=> b!954935 m!885979))

(declare-fun m!885981 () Bool)

(assert (=> b!954935 m!885981))

(declare-fun m!885983 () Bool)

(assert (=> b!954934 m!885983))

(assert (=> b!954932 m!885965))

(assert (=> b!954932 m!885965))

(declare-fun m!885985 () Bool)

(assert (=> b!954932 m!885985))

(declare-fun m!885987 () Bool)

(assert (=> b!954936 m!885987))

(check-sat (not b!954934) (not b!954935) b_and!29851 tp_is_empty!20935 (not b!954932) (not b!954937) (not b!954936) (not b_next!18391) (not start!81878) (not mapNonEmpty!33364))
(check-sat b_and!29851 (not b_next!18391))
