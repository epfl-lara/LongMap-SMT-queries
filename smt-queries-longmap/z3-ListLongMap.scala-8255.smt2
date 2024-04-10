; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100480 () Bool)

(assert start!100480)

(declare-fun b_free!25803 () Bool)

(declare-fun b_next!25803 () Bool)

(assert (=> start!100480 (= b_free!25803 (not b_next!25803))))

(declare-fun tp!90399 () Bool)

(declare-fun b_and!42493 () Bool)

(assert (=> start!100480 (= tp!90399 b_and!42493)))

(declare-fun b!1200068 () Bool)

(declare-fun res!798828 () Bool)

(declare-fun e!681547 () Bool)

(assert (=> b!1200068 (=> (not res!798828) (not e!681547))))

(declare-datatypes ((array!77787 0))(
  ( (array!77788 (arr!37538 (Array (_ BitVec 32) (_ BitVec 64))) (size!38074 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77787)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77787 (_ BitVec 32)) Bool)

(assert (=> b!1200068 (= res!798828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200069 () Bool)

(declare-fun e!681550 () Bool)

(declare-fun e!681549 () Bool)

(assert (=> b!1200069 (= e!681550 (not e!681549))))

(declare-fun res!798829 () Bool)

(assert (=> b!1200069 (=> res!798829 e!681549)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200069 (= res!798829 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200069 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39786 0))(
  ( (Unit!39787) )
))
(declare-fun lt!543941 () Unit!39786)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77787 (_ BitVec 64) (_ BitVec 32)) Unit!39786)

(assert (=> b!1200069 (= lt!543941 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200070 () Bool)

(declare-fun res!798830 () Bool)

(assert (=> b!1200070 (=> (not res!798830) (not e!681547))))

(assert (=> b!1200070 (= res!798830 (= (select (arr!37538 _keys!1208) i!673) k0!934))))

(declare-fun b!1200072 () Bool)

(declare-fun res!798835 () Bool)

(assert (=> b!1200072 (=> (not res!798835) (not e!681547))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45803 0))(
  ( (V!45804 (val!15310 Int)) )
))
(declare-datatypes ((ValueCell!14544 0))(
  ( (ValueCellFull!14544 (v!17948 V!45803)) (EmptyCell!14544) )
))
(declare-datatypes ((array!77789 0))(
  ( (array!77790 (arr!37539 (Array (_ BitVec 32) ValueCell!14544)) (size!38075 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77789)

(assert (=> b!1200072 (= res!798835 (and (= (size!38075 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38074 _keys!1208) (size!38075 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200073 () Bool)

(declare-fun res!798831 () Bool)

(assert (=> b!1200073 (=> (not res!798831) (not e!681547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200073 (= res!798831 (validMask!0 mask!1564))))

(declare-fun b!1200074 () Bool)

(declare-fun res!798836 () Bool)

(assert (=> b!1200074 (=> (not res!798836) (not e!681547))))

(declare-datatypes ((List!26415 0))(
  ( (Nil!26412) (Cons!26411 (h!27620 (_ BitVec 64)) (t!39198 List!26415)) )
))
(declare-fun arrayNoDuplicates!0 (array!77787 (_ BitVec 32) List!26415) Bool)

(assert (=> b!1200074 (= res!798836 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26412))))

(declare-fun mapNonEmpty!47603 () Bool)

(declare-fun mapRes!47603 () Bool)

(declare-fun tp!90398 () Bool)

(declare-fun e!681545 () Bool)

(assert (=> mapNonEmpty!47603 (= mapRes!47603 (and tp!90398 e!681545))))

(declare-fun mapRest!47603 () (Array (_ BitVec 32) ValueCell!14544))

(declare-fun mapKey!47603 () (_ BitVec 32))

(declare-fun mapValue!47603 () ValueCell!14544)

(assert (=> mapNonEmpty!47603 (= (arr!37539 _values!996) (store mapRest!47603 mapKey!47603 mapValue!47603))))

(declare-fun b!1200075 () Bool)

(declare-fun res!798833 () Bool)

(assert (=> b!1200075 (=> (not res!798833) (not e!681550))))

(declare-fun lt!543942 () array!77787)

(assert (=> b!1200075 (= res!798833 (arrayNoDuplicates!0 lt!543942 #b00000000000000000000000000000000 Nil!26412))))

(declare-fun b!1200076 () Bool)

(declare-fun res!798834 () Bool)

(assert (=> b!1200076 (=> (not res!798834) (not e!681547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200076 (= res!798834 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47603 () Bool)

(assert (=> mapIsEmpty!47603 mapRes!47603))

(declare-fun b!1200071 () Bool)

(declare-fun res!798837 () Bool)

(assert (=> b!1200071 (=> (not res!798837) (not e!681547))))

(assert (=> b!1200071 (= res!798837 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38074 _keys!1208))))))

(declare-fun res!798827 () Bool)

(assert (=> start!100480 (=> (not res!798827) (not e!681547))))

(assert (=> start!100480 (= res!798827 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38074 _keys!1208))))))

(assert (=> start!100480 e!681547))

(declare-fun tp_is_empty!30507 () Bool)

(assert (=> start!100480 tp_is_empty!30507))

(declare-fun array_inv!28606 (array!77787) Bool)

(assert (=> start!100480 (array_inv!28606 _keys!1208)))

(assert (=> start!100480 true))

(assert (=> start!100480 tp!90399))

(declare-fun e!681546 () Bool)

(declare-fun array_inv!28607 (array!77789) Bool)

(assert (=> start!100480 (and (array_inv!28607 _values!996) e!681546)))

(declare-fun b!1200077 () Bool)

(assert (=> b!1200077 (= e!681545 tp_is_empty!30507)))

(declare-fun b!1200078 () Bool)

(assert (=> b!1200078 (= e!681547 e!681550)))

(declare-fun res!798832 () Bool)

(assert (=> b!1200078 (=> (not res!798832) (not e!681550))))

(assert (=> b!1200078 (= res!798832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543942 mask!1564))))

(assert (=> b!1200078 (= lt!543942 (array!77788 (store (arr!37538 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38074 _keys!1208)))))

(declare-fun b!1200079 () Bool)

(declare-fun e!681544 () Bool)

(assert (=> b!1200079 (= e!681544 tp_is_empty!30507)))

(declare-fun b!1200080 () Bool)

(assert (=> b!1200080 (= e!681546 (and e!681544 mapRes!47603))))

(declare-fun condMapEmpty!47603 () Bool)

(declare-fun mapDefault!47603 () ValueCell!14544)

(assert (=> b!1200080 (= condMapEmpty!47603 (= (arr!37539 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14544)) mapDefault!47603)))))

(declare-fun b!1200081 () Bool)

(assert (=> b!1200081 (= e!681549 true)))

(declare-fun zeroValue!944 () V!45803)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45803)

(declare-datatypes ((tuple2!19596 0))(
  ( (tuple2!19597 (_1!9809 (_ BitVec 64)) (_2!9809 V!45803)) )
))
(declare-datatypes ((List!26416 0))(
  ( (Nil!26413) (Cons!26412 (h!27621 tuple2!19596) (t!39199 List!26416)) )
))
(declare-datatypes ((ListLongMap!17565 0))(
  ( (ListLongMap!17566 (toList!8798 List!26416)) )
))
(declare-fun lt!543940 () ListLongMap!17565)

(declare-fun getCurrentListMapNoExtraKeys!5237 (array!77787 array!77789 (_ BitVec 32) (_ BitVec 32) V!45803 V!45803 (_ BitVec 32) Int) ListLongMap!17565)

(declare-fun dynLambda!3157 (Int (_ BitVec 64)) V!45803)

(assert (=> b!1200081 (= lt!543940 (getCurrentListMapNoExtraKeys!5237 lt!543942 (array!77790 (store (arr!37539 _values!996) i!673 (ValueCellFull!14544 (dynLambda!3157 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38075 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543943 () ListLongMap!17565)

(assert (=> b!1200081 (= lt!543943 (getCurrentListMapNoExtraKeys!5237 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100480 res!798827) b!1200073))

(assert (= (and b!1200073 res!798831) b!1200072))

(assert (= (and b!1200072 res!798835) b!1200068))

(assert (= (and b!1200068 res!798828) b!1200074))

(assert (= (and b!1200074 res!798836) b!1200071))

(assert (= (and b!1200071 res!798837) b!1200076))

(assert (= (and b!1200076 res!798834) b!1200070))

(assert (= (and b!1200070 res!798830) b!1200078))

(assert (= (and b!1200078 res!798832) b!1200075))

(assert (= (and b!1200075 res!798833) b!1200069))

(assert (= (and b!1200069 (not res!798829)) b!1200081))

(assert (= (and b!1200080 condMapEmpty!47603) mapIsEmpty!47603))

(assert (= (and b!1200080 (not condMapEmpty!47603)) mapNonEmpty!47603))

(get-info :version)

(assert (= (and mapNonEmpty!47603 ((_ is ValueCellFull!14544) mapValue!47603)) b!1200077))

(assert (= (and b!1200080 ((_ is ValueCellFull!14544) mapDefault!47603)) b!1200079))

(assert (= start!100480 b!1200080))

(declare-fun b_lambda!20999 () Bool)

(assert (=> (not b_lambda!20999) (not b!1200081)))

(declare-fun t!39197 () Bool)

(declare-fun tb!10603 () Bool)

(assert (=> (and start!100480 (= defaultEntry!1004 defaultEntry!1004) t!39197) tb!10603))

(declare-fun result!21783 () Bool)

(assert (=> tb!10603 (= result!21783 tp_is_empty!30507)))

(assert (=> b!1200081 t!39197))

(declare-fun b_and!42495 () Bool)

(assert (= b_and!42493 (and (=> t!39197 result!21783) b_and!42495)))

(declare-fun m!1106463 () Bool)

(assert (=> b!1200069 m!1106463))

(declare-fun m!1106465 () Bool)

(assert (=> b!1200069 m!1106465))

(declare-fun m!1106467 () Bool)

(assert (=> b!1200068 m!1106467))

(declare-fun m!1106469 () Bool)

(assert (=> start!100480 m!1106469))

(declare-fun m!1106471 () Bool)

(assert (=> start!100480 m!1106471))

(declare-fun m!1106473 () Bool)

(assert (=> b!1200076 m!1106473))

(declare-fun m!1106475 () Bool)

(assert (=> b!1200075 m!1106475))

(declare-fun m!1106477 () Bool)

(assert (=> b!1200081 m!1106477))

(declare-fun m!1106479 () Bool)

(assert (=> b!1200081 m!1106479))

(declare-fun m!1106481 () Bool)

(assert (=> b!1200081 m!1106481))

(declare-fun m!1106483 () Bool)

(assert (=> b!1200081 m!1106483))

(declare-fun m!1106485 () Bool)

(assert (=> mapNonEmpty!47603 m!1106485))

(declare-fun m!1106487 () Bool)

(assert (=> b!1200074 m!1106487))

(declare-fun m!1106489 () Bool)

(assert (=> b!1200078 m!1106489))

(declare-fun m!1106491 () Bool)

(assert (=> b!1200078 m!1106491))

(declare-fun m!1106493 () Bool)

(assert (=> b!1200073 m!1106493))

(declare-fun m!1106495 () Bool)

(assert (=> b!1200070 m!1106495))

(check-sat (not b!1200081) b_and!42495 tp_is_empty!30507 (not b!1200076) (not b!1200073) (not b!1200069) (not mapNonEmpty!47603) (not b!1200078) (not b!1200075) (not b!1200074) (not start!100480) (not b!1200068) (not b_next!25803) (not b_lambda!20999))
(check-sat b_and!42495 (not b_next!25803))
