; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113818 () Bool)

(assert start!113818)

(declare-fun b_free!31561 () Bool)

(declare-fun b_next!31561 () Bool)

(assert (=> start!113818 (= b_free!31561 (not b_next!31561))))

(declare-fun tp!110494 () Bool)

(declare-fun b_and!50921 () Bool)

(assert (=> start!113818 (= tp!110494 b_and!50921)))

(declare-fun mapNonEmpty!58055 () Bool)

(declare-fun mapRes!58055 () Bool)

(declare-fun tp!110495 () Bool)

(declare-fun e!767972 () Bool)

(assert (=> mapNonEmpty!58055 (= mapRes!58055 (and tp!110495 e!767972))))

(declare-datatypes ((V!55185 0))(
  ( (V!55186 (val!18855 Int)) )
))
(declare-datatypes ((ValueCell!17882 0))(
  ( (ValueCellFull!17882 (v!21502 V!55185)) (EmptyCell!17882) )
))
(declare-fun mapValue!58055 () ValueCell!17882)

(declare-fun mapRest!58055 () (Array (_ BitVec 32) ValueCell!17882))

(declare-fun mapKey!58055 () (_ BitVec 32))

(declare-datatypes ((array!92065 0))(
  ( (array!92066 (arr!44482 (Array (_ BitVec 32) ValueCell!17882)) (size!45033 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92065)

(assert (=> mapNonEmpty!58055 (= (arr!44482 _values!1303) (store mapRest!58055 mapKey!58055 mapValue!58055))))

(declare-fun b!1349783 () Bool)

(declare-fun tp_is_empty!37561 () Bool)

(assert (=> b!1349783 (= e!767972 tp_is_empty!37561)))

(declare-fun b!1349784 () Bool)

(declare-fun res!895219 () Bool)

(declare-fun e!767974 () Bool)

(assert (=> b!1349784 (=> (not res!895219) (not e!767974))))

(declare-datatypes ((array!92067 0))(
  ( (array!92068 (arr!44483 (Array (_ BitVec 32) (_ BitVec 64))) (size!45034 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92067)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92067 (_ BitVec 32)) Bool)

(assert (=> b!1349784 (= res!895219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1349785 () Bool)

(declare-fun res!895218 () Bool)

(assert (=> b!1349785 (=> (not res!895218) (not e!767974))))

(declare-datatypes ((List!31501 0))(
  ( (Nil!31498) (Cons!31497 (h!32715 (_ BitVec 64)) (t!46131 List!31501)) )
))
(declare-fun arrayNoDuplicates!0 (array!92067 (_ BitVec 32) List!31501) Bool)

(assert (=> b!1349785 (= res!895218 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31498))))

(declare-fun b!1349786 () Bool)

(declare-fun res!895215 () Bool)

(assert (=> b!1349786 (=> (not res!895215) (not e!767974))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1349786 (= res!895215 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45034 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!895216 () Bool)

(assert (=> start!113818 (=> (not res!895216) (not e!767974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113818 (= res!895216 (validMask!0 mask!1977))))

(assert (=> start!113818 e!767974))

(assert (=> start!113818 tp_is_empty!37561))

(assert (=> start!113818 true))

(declare-fun array_inv!33769 (array!92067) Bool)

(assert (=> start!113818 (array_inv!33769 _keys!1571)))

(declare-fun e!767973 () Bool)

(declare-fun array_inv!33770 (array!92065) Bool)

(assert (=> start!113818 (and (array_inv!33770 _values!1303) e!767973)))

(assert (=> start!113818 tp!110494))

(declare-fun b!1349787 () Bool)

(declare-fun res!895217 () Bool)

(assert (=> b!1349787 (=> (not res!895217) (not e!767974))))

(assert (=> b!1349787 (= res!895217 (and (= (size!45033 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45034 _keys!1571) (size!45033 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58055 () Bool)

(assert (=> mapIsEmpty!58055 mapRes!58055))

(declare-fun b!1349788 () Bool)

(declare-fun e!767976 () Bool)

(assert (=> b!1349788 (= e!767973 (and e!767976 mapRes!58055))))

(declare-fun condMapEmpty!58055 () Bool)

(declare-fun mapDefault!58055 () ValueCell!17882)

(assert (=> b!1349788 (= condMapEmpty!58055 (= (arr!44482 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17882)) mapDefault!58055)))))

(declare-fun b!1349789 () Bool)

(assert (=> b!1349789 (= e!767976 tp_is_empty!37561)))

(declare-fun b!1349790 () Bool)

(assert (=> b!1349790 (= e!767974 false)))

(declare-fun minValue!1245 () V!55185)

(declare-fun zeroValue!1245 () V!55185)

(declare-fun defaultEntry!1306 () Int)

(declare-fun lt!596647 () Bool)

(declare-datatypes ((tuple2!24364 0))(
  ( (tuple2!24365 (_1!12193 (_ BitVec 64)) (_2!12193 V!55185)) )
))
(declare-datatypes ((List!31502 0))(
  ( (Nil!31499) (Cons!31498 (h!32716 tuple2!24364) (t!46132 List!31502)) )
))
(declare-datatypes ((ListLongMap!22029 0))(
  ( (ListLongMap!22030 (toList!11030 List!31502)) )
))
(declare-fun contains!9221 (ListLongMap!22029 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5968 (array!92067 array!92065 (_ BitVec 32) (_ BitVec 32) V!55185 V!55185 (_ BitVec 32) Int) ListLongMap!22029)

(assert (=> b!1349790 (= lt!596647 (contains!9221 (getCurrentListMap!5968 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113818 res!895216) b!1349787))

(assert (= (and b!1349787 res!895217) b!1349784))

(assert (= (and b!1349784 res!895219) b!1349785))

(assert (= (and b!1349785 res!895218) b!1349786))

(assert (= (and b!1349786 res!895215) b!1349790))

(assert (= (and b!1349788 condMapEmpty!58055) mapIsEmpty!58055))

(assert (= (and b!1349788 (not condMapEmpty!58055)) mapNonEmpty!58055))

(get-info :version)

(assert (= (and mapNonEmpty!58055 ((_ is ValueCellFull!17882) mapValue!58055)) b!1349783))

(assert (= (and b!1349788 ((_ is ValueCellFull!17882) mapDefault!58055)) b!1349789))

(assert (= start!113818 b!1349788))

(declare-fun m!1237169 () Bool)

(assert (=> b!1349784 m!1237169))

(declare-fun m!1237171 () Bool)

(assert (=> b!1349785 m!1237171))

(declare-fun m!1237173 () Bool)

(assert (=> b!1349790 m!1237173))

(assert (=> b!1349790 m!1237173))

(declare-fun m!1237175 () Bool)

(assert (=> b!1349790 m!1237175))

(declare-fun m!1237177 () Bool)

(assert (=> start!113818 m!1237177))

(declare-fun m!1237179 () Bool)

(assert (=> start!113818 m!1237179))

(declare-fun m!1237181 () Bool)

(assert (=> start!113818 m!1237181))

(declare-fun m!1237183 () Bool)

(assert (=> mapNonEmpty!58055 m!1237183))

(check-sat (not mapNonEmpty!58055) (not b_next!31561) (not b!1349784) (not b!1349790) (not b!1349785) (not start!113818) tp_is_empty!37561 b_and!50921)
(check-sat b_and!50921 (not b_next!31561))
