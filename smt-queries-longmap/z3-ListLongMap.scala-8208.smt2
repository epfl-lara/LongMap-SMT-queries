; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100350 () Bool)

(assert start!100350)

(declare-fun mapIsEmpty!47162 () Bool)

(declare-fun mapRes!47162 () Bool)

(assert (=> mapIsEmpty!47162 mapRes!47162))

(declare-fun b!1195139 () Bool)

(declare-fun e!679336 () Bool)

(declare-fun e!679338 () Bool)

(assert (=> b!1195139 (= e!679336 (and e!679338 mapRes!47162))))

(declare-fun condMapEmpty!47162 () Bool)

(declare-datatypes ((V!45425 0))(
  ( (V!45426 (val!15168 Int)) )
))
(declare-datatypes ((ValueCell!14402 0))(
  ( (ValueCellFull!14402 (v!17802 V!45425)) (EmptyCell!14402) )
))
(declare-datatypes ((array!77267 0))(
  ( (array!77268 (arr!37277 (Array (_ BitVec 32) ValueCell!14402)) (size!37814 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77267)

(declare-fun mapDefault!47162 () ValueCell!14402)

(assert (=> b!1195139 (= condMapEmpty!47162 (= (arr!37277 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14402)) mapDefault!47162)))))

(declare-fun b!1195140 () Bool)

(declare-fun e!679339 () Bool)

(assert (=> b!1195140 (= e!679339 false)))

(declare-fun lt!543172 () Bool)

(declare-datatypes ((array!77269 0))(
  ( (array!77270 (arr!37278 (Array (_ BitVec 32) (_ BitVec 64))) (size!37815 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77269)

(declare-datatypes ((List!26278 0))(
  ( (Nil!26275) (Cons!26274 (h!27492 (_ BitVec 64)) (t!38941 List!26278)) )
))
(declare-fun arrayNoDuplicates!0 (array!77269 (_ BitVec 32) List!26278) Bool)

(assert (=> b!1195140 (= lt!543172 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26275))))

(declare-fun res!794804 () Bool)

(assert (=> start!100350 (=> (not res!794804) (not e!679339))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100350 (= res!794804 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37815 _keys!1208))))))

(assert (=> start!100350 e!679339))

(declare-fun array_inv!28484 (array!77269) Bool)

(assert (=> start!100350 (array_inv!28484 _keys!1208)))

(assert (=> start!100350 true))

(declare-fun array_inv!28485 (array!77267) Bool)

(assert (=> start!100350 (and (array_inv!28485 _values!996) e!679336)))

(declare-fun b!1195141 () Bool)

(declare-fun res!794801 () Bool)

(assert (=> b!1195141 (=> (not res!794801) (not e!679339))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1195141 (= res!794801 (and (= (size!37814 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37815 _keys!1208) (size!37814 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195142 () Bool)

(declare-fun e!679340 () Bool)

(declare-fun tp_is_empty!30223 () Bool)

(assert (=> b!1195142 (= e!679340 tp_is_empty!30223)))

(declare-fun b!1195143 () Bool)

(assert (=> b!1195143 (= e!679338 tp_is_empty!30223)))

(declare-fun b!1195144 () Bool)

(declare-fun res!794803 () Bool)

(assert (=> b!1195144 (=> (not res!794803) (not e!679339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195144 (= res!794803 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47162 () Bool)

(declare-fun tp!89772 () Bool)

(assert (=> mapNonEmpty!47162 (= mapRes!47162 (and tp!89772 e!679340))))

(declare-fun mapRest!47162 () (Array (_ BitVec 32) ValueCell!14402))

(declare-fun mapValue!47162 () ValueCell!14402)

(declare-fun mapKey!47162 () (_ BitVec 32))

(assert (=> mapNonEmpty!47162 (= (arr!37277 _values!996) (store mapRest!47162 mapKey!47162 mapValue!47162))))

(declare-fun b!1195145 () Bool)

(declare-fun res!794802 () Bool)

(assert (=> b!1195145 (=> (not res!794802) (not e!679339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77269 (_ BitVec 32)) Bool)

(assert (=> b!1195145 (= res!794802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100350 res!794804) b!1195144))

(assert (= (and b!1195144 res!794803) b!1195141))

(assert (= (and b!1195141 res!794801) b!1195145))

(assert (= (and b!1195145 res!794802) b!1195140))

(assert (= (and b!1195139 condMapEmpty!47162) mapIsEmpty!47162))

(assert (= (and b!1195139 (not condMapEmpty!47162)) mapNonEmpty!47162))

(get-info :version)

(assert (= (and mapNonEmpty!47162 ((_ is ValueCellFull!14402) mapValue!47162)) b!1195142))

(assert (= (and b!1195139 ((_ is ValueCellFull!14402) mapDefault!47162)) b!1195143))

(assert (= start!100350 b!1195139))

(declare-fun m!1103571 () Bool)

(assert (=> b!1195145 m!1103571))

(declare-fun m!1103573 () Bool)

(assert (=> b!1195140 m!1103573))

(declare-fun m!1103575 () Bool)

(assert (=> mapNonEmpty!47162 m!1103575))

(declare-fun m!1103577 () Bool)

(assert (=> start!100350 m!1103577))

(declare-fun m!1103579 () Bool)

(assert (=> start!100350 m!1103579))

(declare-fun m!1103581 () Bool)

(assert (=> b!1195144 m!1103581))

(check-sat (not start!100350) tp_is_empty!30223 (not b!1195140) (not b!1195144) (not b!1195145) (not mapNonEmpty!47162))
(check-sat)
