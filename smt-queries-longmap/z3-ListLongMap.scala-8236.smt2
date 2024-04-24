; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100582 () Bool)

(assert start!100582)

(declare-fun b!1198777 () Bool)

(declare-fun res!797414 () Bool)

(declare-fun e!681128 () Bool)

(assert (=> b!1198777 (=> (not res!797414) (not e!681128))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45649 0))(
  ( (V!45650 (val!15252 Int)) )
))
(declare-datatypes ((ValueCell!14486 0))(
  ( (ValueCellFull!14486 (v!17886 V!45649)) (EmptyCell!14486) )
))
(declare-datatypes ((array!77599 0))(
  ( (array!77600 (arr!37439 (Array (_ BitVec 32) ValueCell!14486)) (size!37976 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77599)

(declare-datatypes ((array!77601 0))(
  ( (array!77602 (arr!37440 (Array (_ BitVec 32) (_ BitVec 64))) (size!37977 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77601)

(assert (=> b!1198777 (= res!797414 (and (= (size!37976 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37977 _keys!1208) (size!37976 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198778 () Bool)

(declare-fun e!681127 () Bool)

(declare-fun tp_is_empty!30391 () Bool)

(assert (=> b!1198778 (= e!681127 tp_is_empty!30391)))

(declare-fun b!1198779 () Bool)

(declare-fun res!797419 () Bool)

(assert (=> b!1198779 (=> (not res!797419) (not e!681128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198779 (= res!797419 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47426 () Bool)

(declare-fun mapRes!47426 () Bool)

(declare-fun tp!90081 () Bool)

(declare-fun e!681125 () Bool)

(assert (=> mapNonEmpty!47426 (= mapRes!47426 (and tp!90081 e!681125))))

(declare-fun mapKey!47426 () (_ BitVec 32))

(declare-fun mapRest!47426 () (Array (_ BitVec 32) ValueCell!14486))

(declare-fun mapValue!47426 () ValueCell!14486)

(assert (=> mapNonEmpty!47426 (= (arr!37439 _values!996) (store mapRest!47426 mapKey!47426 mapValue!47426))))

(declare-fun b!1198780 () Bool)

(assert (=> b!1198780 (= e!681125 tp_is_empty!30391)))

(declare-fun b!1198781 () Bool)

(declare-fun e!681124 () Bool)

(assert (=> b!1198781 (= e!681128 e!681124)))

(declare-fun res!797413 () Bool)

(assert (=> b!1198781 (=> (not res!797413) (not e!681124))))

(declare-fun lt!543789 () array!77601)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77601 (_ BitVec 32)) Bool)

(assert (=> b!1198781 (= res!797413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543789 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198781 (= lt!543789 (array!77602 (store (arr!37440 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37977 _keys!1208)))))

(declare-fun b!1198782 () Bool)

(declare-fun res!797418 () Bool)

(assert (=> b!1198782 (=> (not res!797418) (not e!681128))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1198782 (= res!797418 (= (select (arr!37440 _keys!1208) i!673) k0!934))))

(declare-fun b!1198783 () Bool)

(declare-fun res!797422 () Bool)

(assert (=> b!1198783 (=> (not res!797422) (not e!681128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198783 (= res!797422 (validKeyInArray!0 k0!934))))

(declare-fun b!1198785 () Bool)

(declare-fun res!797415 () Bool)

(assert (=> b!1198785 (=> (not res!797415) (not e!681128))))

(assert (=> b!1198785 (= res!797415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198786 () Bool)

(assert (=> b!1198786 (= e!681124 (not true))))

(declare-fun arrayContainsKey!0 (array!77601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198786 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39671 0))(
  ( (Unit!39672) )
))
(declare-fun lt!543790 () Unit!39671)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77601 (_ BitVec 64) (_ BitVec 32)) Unit!39671)

(assert (=> b!1198786 (= lt!543790 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198787 () Bool)

(declare-fun res!797420 () Bool)

(assert (=> b!1198787 (=> (not res!797420) (not e!681124))))

(declare-datatypes ((List!26356 0))(
  ( (Nil!26353) (Cons!26352 (h!27570 (_ BitVec 64)) (t!39049 List!26356)) )
))
(declare-fun arrayNoDuplicates!0 (array!77601 (_ BitVec 32) List!26356) Bool)

(assert (=> b!1198787 (= res!797420 (arrayNoDuplicates!0 lt!543789 #b00000000000000000000000000000000 Nil!26353))))

(declare-fun b!1198788 () Bool)

(declare-fun res!797416 () Bool)

(assert (=> b!1198788 (=> (not res!797416) (not e!681128))))

(assert (=> b!1198788 (= res!797416 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37977 _keys!1208))))))

(declare-fun mapIsEmpty!47426 () Bool)

(assert (=> mapIsEmpty!47426 mapRes!47426))

(declare-fun b!1198789 () Bool)

(declare-fun e!681129 () Bool)

(assert (=> b!1198789 (= e!681129 (and e!681127 mapRes!47426))))

(declare-fun condMapEmpty!47426 () Bool)

(declare-fun mapDefault!47426 () ValueCell!14486)

(assert (=> b!1198789 (= condMapEmpty!47426 (= (arr!37439 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14486)) mapDefault!47426)))))

(declare-fun res!797421 () Bool)

(assert (=> start!100582 (=> (not res!797421) (not e!681128))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100582 (= res!797421 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37977 _keys!1208))))))

(assert (=> start!100582 e!681128))

(declare-fun array_inv!28604 (array!77601) Bool)

(assert (=> start!100582 (array_inv!28604 _keys!1208)))

(assert (=> start!100582 true))

(declare-fun array_inv!28605 (array!77599) Bool)

(assert (=> start!100582 (and (array_inv!28605 _values!996) e!681129)))

(declare-fun b!1198784 () Bool)

(declare-fun res!797417 () Bool)

(assert (=> b!1198784 (=> (not res!797417) (not e!681128))))

(assert (=> b!1198784 (= res!797417 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26353))))

(assert (= (and start!100582 res!797421) b!1198779))

(assert (= (and b!1198779 res!797419) b!1198777))

(assert (= (and b!1198777 res!797414) b!1198785))

(assert (= (and b!1198785 res!797415) b!1198784))

(assert (= (and b!1198784 res!797417) b!1198788))

(assert (= (and b!1198788 res!797416) b!1198783))

(assert (= (and b!1198783 res!797422) b!1198782))

(assert (= (and b!1198782 res!797418) b!1198781))

(assert (= (and b!1198781 res!797413) b!1198787))

(assert (= (and b!1198787 res!797420) b!1198786))

(assert (= (and b!1198789 condMapEmpty!47426) mapIsEmpty!47426))

(assert (= (and b!1198789 (not condMapEmpty!47426)) mapNonEmpty!47426))

(get-info :version)

(assert (= (and mapNonEmpty!47426 ((_ is ValueCellFull!14486) mapValue!47426)) b!1198780))

(assert (= (and b!1198789 ((_ is ValueCellFull!14486) mapDefault!47426)) b!1198778))

(assert (= start!100582 b!1198789))

(declare-fun m!1106101 () Bool)

(assert (=> b!1198784 m!1106101))

(declare-fun m!1106103 () Bool)

(assert (=> b!1198787 m!1106103))

(declare-fun m!1106105 () Bool)

(assert (=> mapNonEmpty!47426 m!1106105))

(declare-fun m!1106107 () Bool)

(assert (=> b!1198785 m!1106107))

(declare-fun m!1106109 () Bool)

(assert (=> b!1198782 m!1106109))

(declare-fun m!1106111 () Bool)

(assert (=> b!1198779 m!1106111))

(declare-fun m!1106113 () Bool)

(assert (=> b!1198781 m!1106113))

(declare-fun m!1106115 () Bool)

(assert (=> b!1198781 m!1106115))

(declare-fun m!1106117 () Bool)

(assert (=> start!100582 m!1106117))

(declare-fun m!1106119 () Bool)

(assert (=> start!100582 m!1106119))

(declare-fun m!1106121 () Bool)

(assert (=> b!1198786 m!1106121))

(declare-fun m!1106123 () Bool)

(assert (=> b!1198786 m!1106123))

(declare-fun m!1106125 () Bool)

(assert (=> b!1198783 m!1106125))

(check-sat (not b!1198783) (not b!1198781) (not start!100582) (not b!1198779) (not b!1198784) (not mapNonEmpty!47426) tp_is_empty!30391 (not b!1198785) (not b!1198786) (not b!1198787))
(check-sat)
