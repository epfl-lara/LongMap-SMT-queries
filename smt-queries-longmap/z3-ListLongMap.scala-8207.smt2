; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100110 () Bool)

(assert start!100110)

(declare-fun mapNonEmpty!47156 () Bool)

(declare-fun mapRes!47156 () Bool)

(declare-fun tp!89766 () Bool)

(declare-fun e!678474 () Bool)

(assert (=> mapNonEmpty!47156 (= mapRes!47156 (and tp!89766 e!678474))))

(declare-datatypes ((V!45419 0))(
  ( (V!45420 (val!15166 Int)) )
))
(declare-datatypes ((ValueCell!14400 0))(
  ( (ValueCellFull!14400 (v!17804 V!45419)) (EmptyCell!14400) )
))
(declare-fun mapValue!47156 () ValueCell!14400)

(declare-fun mapRest!47156 () (Array (_ BitVec 32) ValueCell!14400))

(declare-datatypes ((array!77217 0))(
  ( (array!77218 (arr!37258 (Array (_ BitVec 32) ValueCell!14400)) (size!37794 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77217)

(declare-fun mapKey!47156 () (_ BitVec 32))

(assert (=> mapNonEmpty!47156 (= (arr!37258 _values!996) (store mapRest!47156 mapKey!47156 mapValue!47156))))

(declare-fun res!794271 () Bool)

(declare-fun e!678475 () Bool)

(assert (=> start!100110 (=> (not res!794271) (not e!678475))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77219 0))(
  ( (array!77220 (arr!37259 (Array (_ BitVec 32) (_ BitVec 64))) (size!37795 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77219)

(assert (=> start!100110 (= res!794271 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37795 _keys!1208))))))

(assert (=> start!100110 e!678475))

(declare-fun array_inv!28408 (array!77219) Bool)

(assert (=> start!100110 (array_inv!28408 _keys!1208)))

(assert (=> start!100110 true))

(declare-fun e!678478 () Bool)

(declare-fun array_inv!28409 (array!77217) Bool)

(assert (=> start!100110 (and (array_inv!28409 _values!996) e!678478)))

(declare-fun b!1193808 () Bool)

(declare-fun e!678477 () Bool)

(assert (=> b!1193808 (= e!678478 (and e!678477 mapRes!47156))))

(declare-fun condMapEmpty!47156 () Bool)

(declare-fun mapDefault!47156 () ValueCell!14400)

(assert (=> b!1193808 (= condMapEmpty!47156 (= (arr!37258 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14400)) mapDefault!47156)))))

(declare-fun mapIsEmpty!47156 () Bool)

(assert (=> mapIsEmpty!47156 mapRes!47156))

(declare-fun b!1193809 () Bool)

(declare-fun res!794272 () Bool)

(assert (=> b!1193809 (=> (not res!794272) (not e!678475))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193809 (= res!794272 (validMask!0 mask!1564))))

(declare-fun b!1193810 () Bool)

(declare-fun tp_is_empty!30219 () Bool)

(assert (=> b!1193810 (= e!678477 tp_is_empty!30219)))

(declare-fun b!1193811 () Bool)

(assert (=> b!1193811 (= e!678475 false)))

(declare-fun lt!542682 () Bool)

(declare-datatypes ((List!26245 0))(
  ( (Nil!26242) (Cons!26241 (h!27450 (_ BitVec 64)) (t!38916 List!26245)) )
))
(declare-fun arrayNoDuplicates!0 (array!77219 (_ BitVec 32) List!26245) Bool)

(assert (=> b!1193811 (= lt!542682 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26242))))

(declare-fun b!1193812 () Bool)

(declare-fun res!794270 () Bool)

(assert (=> b!1193812 (=> (not res!794270) (not e!678475))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1193812 (= res!794270 (and (= (size!37794 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37795 _keys!1208) (size!37794 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193813 () Bool)

(assert (=> b!1193813 (= e!678474 tp_is_empty!30219)))

(declare-fun b!1193814 () Bool)

(declare-fun res!794269 () Bool)

(assert (=> b!1193814 (=> (not res!794269) (not e!678475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77219 (_ BitVec 32)) Bool)

(assert (=> b!1193814 (= res!794269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100110 res!794271) b!1193809))

(assert (= (and b!1193809 res!794272) b!1193812))

(assert (= (and b!1193812 res!794270) b!1193814))

(assert (= (and b!1193814 res!794269) b!1193811))

(assert (= (and b!1193808 condMapEmpty!47156) mapIsEmpty!47156))

(assert (= (and b!1193808 (not condMapEmpty!47156)) mapNonEmpty!47156))

(get-info :version)

(assert (= (and mapNonEmpty!47156 ((_ is ValueCellFull!14400) mapValue!47156)) b!1193813))

(assert (= (and b!1193808 ((_ is ValueCellFull!14400) mapDefault!47156)) b!1193810))

(assert (= start!100110 b!1193808))

(declare-fun m!1101975 () Bool)

(assert (=> b!1193809 m!1101975))

(declare-fun m!1101977 () Bool)

(assert (=> b!1193814 m!1101977))

(declare-fun m!1101979 () Bool)

(assert (=> b!1193811 m!1101979))

(declare-fun m!1101981 () Bool)

(assert (=> start!100110 m!1101981))

(declare-fun m!1101983 () Bool)

(assert (=> start!100110 m!1101983))

(declare-fun m!1101985 () Bool)

(assert (=> mapNonEmpty!47156 m!1101985))

(check-sat (not start!100110) (not mapNonEmpty!47156) (not b!1193809) (not b!1193811) tp_is_empty!30219 (not b!1193814))
(check-sat)
