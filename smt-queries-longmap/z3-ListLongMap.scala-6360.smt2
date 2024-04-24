; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82064 () Bool)

(assert start!82064)

(declare-fun b_free!18391 () Bool)

(declare-fun b_next!18391 () Bool)

(assert (=> start!82064 (= b_free!18391 (not b_next!18391))))

(declare-fun tp!63873 () Bool)

(declare-fun b_and!29887 () Bool)

(assert (=> start!82064 (= tp!63873 b_and!29887)))

(declare-fun b!956070 () Bool)

(declare-fun e!538703 () Bool)

(assert (=> b!956070 (= e!538703 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32897 0))(
  ( (V!32898 (val!10518 Int)) )
))
(declare-fun zeroValue!1139 () V!32897)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58024 0))(
  ( (array!58025 (arr!27887 (Array (_ BitVec 32) (_ BitVec 64))) (size!28367 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58024)

(declare-datatypes ((ValueCell!9986 0))(
  ( (ValueCellFull!9986 (v!13070 V!32897)) (EmptyCell!9986) )
))
(declare-datatypes ((array!58026 0))(
  ( (array!58027 (arr!27888 (Array (_ BitVec 32) ValueCell!9986)) (size!28368 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58026)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32897)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13642 0))(
  ( (tuple2!13643 (_1!6832 (_ BitVec 64)) (_2!6832 V!32897)) )
))
(declare-datatypes ((List!19426 0))(
  ( (Nil!19423) (Cons!19422 (h!20590 tuple2!13642) (t!27779 List!19426)) )
))
(declare-datatypes ((ListLongMap!12341 0))(
  ( (ListLongMap!12342 (toList!6186 List!19426)) )
))
(declare-fun contains!5295 (ListLongMap!12341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3419 (array!58024 array!58026 (_ BitVec 32) (_ BitVec 32) V!32897 V!32897 (_ BitVec 32) Int) ListLongMap!12341)

(assert (=> b!956070 (contains!5295 (getCurrentListMap!3419 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27887 _keys!1441) i!735))))

(declare-datatypes ((Unit!32076 0))(
  ( (Unit!32077) )
))
(declare-fun lt!430341 () Unit!32076)

(declare-fun lemmaInListMapFromThenFromZero!3 (array!58024 array!58026 (_ BitVec 32) (_ BitVec 32) V!32897 V!32897 (_ BitVec 32) (_ BitVec 32) Int) Unit!32076)

(assert (=> b!956070 (= lt!430341 (lemmaInListMapFromThenFromZero!3 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956071 () Bool)

(declare-fun e!538701 () Bool)

(declare-fun e!538702 () Bool)

(declare-fun mapRes!33364 () Bool)

(assert (=> b!956071 (= e!538701 (and e!538702 mapRes!33364))))

(declare-fun condMapEmpty!33364 () Bool)

(declare-fun mapDefault!33364 () ValueCell!9986)

(assert (=> b!956071 (= condMapEmpty!33364 (= (arr!27888 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9986)) mapDefault!33364)))))

(declare-fun b!956072 () Bool)

(declare-fun res!639969 () Bool)

(assert (=> b!956072 (=> (not res!639969) (not e!538703))))

(assert (=> b!956072 (= res!639969 (and (= (size!28368 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28367 _keys!1441) (size!28368 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!639974 () Bool)

(assert (=> start!82064 (=> (not res!639974) (not e!538703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82064 (= res!639974 (validMask!0 mask!1823))))

(assert (=> start!82064 e!538703))

(assert (=> start!82064 true))

(declare-fun tp_is_empty!20935 () Bool)

(assert (=> start!82064 tp_is_empty!20935))

(declare-fun array_inv!21721 (array!58024) Bool)

(assert (=> start!82064 (array_inv!21721 _keys!1441)))

(declare-fun array_inv!21722 (array!58026) Bool)

(assert (=> start!82064 (and (array_inv!21722 _values!1197) e!538701)))

(assert (=> start!82064 tp!63873))

(declare-fun mapNonEmpty!33364 () Bool)

(declare-fun tp!63874 () Bool)

(declare-fun e!538705 () Bool)

(assert (=> mapNonEmpty!33364 (= mapRes!33364 (and tp!63874 e!538705))))

(declare-fun mapValue!33364 () ValueCell!9986)

(declare-fun mapRest!33364 () (Array (_ BitVec 32) ValueCell!9986))

(declare-fun mapKey!33364 () (_ BitVec 32))

(assert (=> mapNonEmpty!33364 (= (arr!27888 _values!1197) (store mapRest!33364 mapKey!33364 mapValue!33364))))

(declare-fun b!956073 () Bool)

(declare-fun res!639971 () Bool)

(assert (=> b!956073 (=> (not res!639971) (not e!538703))))

(declare-datatypes ((List!19427 0))(
  ( (Nil!19424) (Cons!19423 (h!20591 (_ BitVec 64)) (t!27780 List!19427)) )
))
(declare-fun arrayNoDuplicates!0 (array!58024 (_ BitVec 32) List!19427) Bool)

(assert (=> b!956073 (= res!639971 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19424))))

(declare-fun b!956074 () Bool)

(assert (=> b!956074 (= e!538702 tp_is_empty!20935)))

(declare-fun b!956075 () Bool)

(declare-fun res!639972 () Bool)

(assert (=> b!956075 (=> (not res!639972) (not e!538703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58024 (_ BitVec 32)) Bool)

(assert (=> b!956075 (= res!639972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33364 () Bool)

(assert (=> mapIsEmpty!33364 mapRes!33364))

(declare-fun b!956076 () Bool)

(declare-fun res!639970 () Bool)

(assert (=> b!956076 (=> (not res!639970) (not e!538703))))

(assert (=> b!956076 (= res!639970 (contains!5295 (getCurrentListMap!3419 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27887 _keys!1441) i!735)))))

(declare-fun b!956077 () Bool)

(assert (=> b!956077 (= e!538705 tp_is_empty!20935)))

(declare-fun b!956078 () Bool)

(declare-fun res!639973 () Bool)

(assert (=> b!956078 (=> (not res!639973) (not e!538703))))

(assert (=> b!956078 (= res!639973 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28367 _keys!1441))))))

(declare-fun b!956079 () Bool)

(declare-fun res!639968 () Bool)

(assert (=> b!956079 (=> (not res!639968) (not e!538703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956079 (= res!639968 (validKeyInArray!0 (select (arr!27887 _keys!1441) i!735)))))

(assert (= (and start!82064 res!639974) b!956072))

(assert (= (and b!956072 res!639969) b!956075))

(assert (= (and b!956075 res!639972) b!956073))

(assert (= (and b!956073 res!639971) b!956078))

(assert (= (and b!956078 res!639973) b!956079))

(assert (= (and b!956079 res!639968) b!956076))

(assert (= (and b!956076 res!639970) b!956070))

(assert (= (and b!956071 condMapEmpty!33364) mapIsEmpty!33364))

(assert (= (and b!956071 (not condMapEmpty!33364)) mapNonEmpty!33364))

(get-info :version)

(assert (= (and mapNonEmpty!33364 ((_ is ValueCellFull!9986) mapValue!33364)) b!956077))

(assert (= (and b!956071 ((_ is ValueCellFull!9986) mapDefault!33364)) b!956074))

(assert (= start!82064 b!956071))

(declare-fun m!888015 () Bool)

(assert (=> b!956075 m!888015))

(declare-fun m!888017 () Bool)

(assert (=> b!956073 m!888017))

(declare-fun m!888019 () Bool)

(assert (=> b!956079 m!888019))

(assert (=> b!956079 m!888019))

(declare-fun m!888021 () Bool)

(assert (=> b!956079 m!888021))

(declare-fun m!888023 () Bool)

(assert (=> b!956070 m!888023))

(assert (=> b!956070 m!888019))

(assert (=> b!956070 m!888023))

(assert (=> b!956070 m!888019))

(declare-fun m!888025 () Bool)

(assert (=> b!956070 m!888025))

(declare-fun m!888027 () Bool)

(assert (=> b!956070 m!888027))

(declare-fun m!888029 () Bool)

(assert (=> b!956076 m!888029))

(assert (=> b!956076 m!888019))

(assert (=> b!956076 m!888029))

(assert (=> b!956076 m!888019))

(declare-fun m!888031 () Bool)

(assert (=> b!956076 m!888031))

(declare-fun m!888033 () Bool)

(assert (=> mapNonEmpty!33364 m!888033))

(declare-fun m!888035 () Bool)

(assert (=> start!82064 m!888035))

(declare-fun m!888037 () Bool)

(assert (=> start!82064 m!888037))

(declare-fun m!888039 () Bool)

(assert (=> start!82064 m!888039))

(check-sat (not mapNonEmpty!33364) (not b!956075) (not b!956076) (not start!82064) (not b!956070) (not b!956079) tp_is_empty!20935 b_and!29887 (not b_next!18391) (not b!956073))
(check-sat b_and!29887 (not b_next!18391))
