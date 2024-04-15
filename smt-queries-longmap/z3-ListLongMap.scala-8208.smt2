; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100108 () Bool)

(assert start!100108)

(declare-fun b!1193726 () Bool)

(declare-fun res!794230 () Bool)

(declare-fun e!678428 () Bool)

(assert (=> b!1193726 (=> (not res!794230) (not e!678428))))

(declare-datatypes ((array!77162 0))(
  ( (array!77163 (arr!37231 (Array (_ BitVec 32) (_ BitVec 64))) (size!37769 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77162)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45425 0))(
  ( (V!45426 (val!15168 Int)) )
))
(declare-datatypes ((ValueCell!14402 0))(
  ( (ValueCellFull!14402 (v!17805 V!45425)) (EmptyCell!14402) )
))
(declare-datatypes ((array!77164 0))(
  ( (array!77165 (arr!37232 (Array (_ BitVec 32) ValueCell!14402)) (size!37770 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77164)

(assert (=> b!1193726 (= res!794230 (and (= (size!37770 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37769 _keys!1208) (size!37770 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193727 () Bool)

(declare-fun e!678430 () Bool)

(declare-fun e!678429 () Bool)

(declare-fun mapRes!47162 () Bool)

(assert (=> b!1193727 (= e!678430 (and e!678429 mapRes!47162))))

(declare-fun condMapEmpty!47162 () Bool)

(declare-fun mapDefault!47162 () ValueCell!14402)

(assert (=> b!1193727 (= condMapEmpty!47162 (= (arr!37232 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14402)) mapDefault!47162)))))

(declare-fun mapIsEmpty!47162 () Bool)

(assert (=> mapIsEmpty!47162 mapRes!47162))

(declare-fun res!794228 () Bool)

(assert (=> start!100108 (=> (not res!794228) (not e!678428))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100108 (= res!794228 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37769 _keys!1208))))))

(assert (=> start!100108 e!678428))

(declare-fun array_inv!28506 (array!77162) Bool)

(assert (=> start!100108 (array_inv!28506 _keys!1208)))

(assert (=> start!100108 true))

(declare-fun array_inv!28507 (array!77164) Bool)

(assert (=> start!100108 (and (array_inv!28507 _values!996) e!678430)))

(declare-fun b!1193728 () Bool)

(declare-fun e!678426 () Bool)

(declare-fun tp_is_empty!30223 () Bool)

(assert (=> b!1193728 (= e!678426 tp_is_empty!30223)))

(declare-fun b!1193729 () Bool)

(assert (=> b!1193729 (= e!678429 tp_is_empty!30223)))

(declare-fun b!1193730 () Bool)

(assert (=> b!1193730 (= e!678428 false)))

(declare-fun lt!542496 () Bool)

(declare-datatypes ((List!26324 0))(
  ( (Nil!26321) (Cons!26320 (h!27529 (_ BitVec 64)) (t!38986 List!26324)) )
))
(declare-fun arrayNoDuplicates!0 (array!77162 (_ BitVec 32) List!26324) Bool)

(assert (=> b!1193730 (= lt!542496 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26321))))

(declare-fun b!1193731 () Bool)

(declare-fun res!794227 () Bool)

(assert (=> b!1193731 (=> (not res!794227) (not e!678428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193731 (= res!794227 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47162 () Bool)

(declare-fun tp!89772 () Bool)

(assert (=> mapNonEmpty!47162 (= mapRes!47162 (and tp!89772 e!678426))))

(declare-fun mapKey!47162 () (_ BitVec 32))

(declare-fun mapValue!47162 () ValueCell!14402)

(declare-fun mapRest!47162 () (Array (_ BitVec 32) ValueCell!14402))

(assert (=> mapNonEmpty!47162 (= (arr!37232 _values!996) (store mapRest!47162 mapKey!47162 mapValue!47162))))

(declare-fun b!1193732 () Bool)

(declare-fun res!794229 () Bool)

(assert (=> b!1193732 (=> (not res!794229) (not e!678428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77162 (_ BitVec 32)) Bool)

(assert (=> b!1193732 (= res!794229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100108 res!794228) b!1193731))

(assert (= (and b!1193731 res!794227) b!1193726))

(assert (= (and b!1193726 res!794230) b!1193732))

(assert (= (and b!1193732 res!794229) b!1193730))

(assert (= (and b!1193727 condMapEmpty!47162) mapIsEmpty!47162))

(assert (= (and b!1193727 (not condMapEmpty!47162)) mapNonEmpty!47162))

(get-info :version)

(assert (= (and mapNonEmpty!47162 ((_ is ValueCellFull!14402) mapValue!47162)) b!1193728))

(assert (= (and b!1193727 ((_ is ValueCellFull!14402) mapDefault!47162)) b!1193729))

(assert (= start!100108 b!1193727))

(declare-fun m!1101389 () Bool)

(assert (=> b!1193730 m!1101389))

(declare-fun m!1101391 () Bool)

(assert (=> b!1193731 m!1101391))

(declare-fun m!1101393 () Bool)

(assert (=> b!1193732 m!1101393))

(declare-fun m!1101395 () Bool)

(assert (=> start!100108 m!1101395))

(declare-fun m!1101397 () Bool)

(assert (=> start!100108 m!1101397))

(declare-fun m!1101399 () Bool)

(assert (=> mapNonEmpty!47162 m!1101399))

(check-sat (not b!1193730) (not mapNonEmpty!47162) (not start!100108) tp_is_empty!30223 (not b!1193731) (not b!1193732))
(check-sat)
