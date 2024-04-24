; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72982 () Bool)

(assert start!72982)

(declare-fun b!845915 () Bool)

(declare-fun e!472305 () Bool)

(declare-fun e!472308 () Bool)

(declare-fun mapRes!25397 () Bool)

(assert (=> b!845915 (= e!472305 (and e!472308 mapRes!25397))))

(declare-fun condMapEmpty!25397 () Bool)

(declare-datatypes ((V!26201 0))(
  ( (V!26202 (val!7980 Int)) )
))
(declare-datatypes ((ValueCell!7493 0))(
  ( (ValueCellFull!7493 (v!10405 V!26201)) (EmptyCell!7493) )
))
(declare-datatypes ((array!47997 0))(
  ( (array!47998 (arr!23025 (Array (_ BitVec 32) ValueCell!7493)) (size!23466 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47997)

(declare-fun mapDefault!25397 () ValueCell!7493)

(assert (=> b!845915 (= condMapEmpty!25397 (= (arr!23025 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7493)) mapDefault!25397)))))

(declare-fun res!574404 () Bool)

(declare-fun e!472309 () Bool)

(assert (=> start!72982 (=> (not res!574404) (not e!472309))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47999 0))(
  ( (array!48000 (arr!23026 (Array (_ BitVec 32) (_ BitVec 64))) (size!23467 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47999)

(assert (=> start!72982 (= res!574404 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23467 _keys!868))))))

(assert (=> start!72982 e!472309))

(assert (=> start!72982 true))

(declare-fun array_inv!18352 (array!47999) Bool)

(assert (=> start!72982 (array_inv!18352 _keys!868)))

(declare-fun array_inv!18353 (array!47997) Bool)

(assert (=> start!72982 (and (array_inv!18353 _values!688) e!472305)))

(declare-fun b!845916 () Bool)

(declare-fun res!574405 () Bool)

(assert (=> b!845916 (=> (not res!574405) (not e!472309))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845916 (= res!574405 (validMask!0 mask!1196))))

(declare-fun b!845917 () Bool)

(declare-fun e!472307 () Bool)

(declare-fun tp_is_empty!15865 () Bool)

(assert (=> b!845917 (= e!472307 tp_is_empty!15865)))

(declare-fun b!845918 () Bool)

(declare-fun res!574402 () Bool)

(assert (=> b!845918 (=> (not res!574402) (not e!472309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47999 (_ BitVec 32)) Bool)

(assert (=> b!845918 (= res!574402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845919 () Bool)

(assert (=> b!845919 (= e!472308 tp_is_empty!15865)))

(declare-fun mapNonEmpty!25397 () Bool)

(declare-fun tp!48716 () Bool)

(assert (=> mapNonEmpty!25397 (= mapRes!25397 (and tp!48716 e!472307))))

(declare-fun mapKey!25397 () (_ BitVec 32))

(declare-fun mapValue!25397 () ValueCell!7493)

(declare-fun mapRest!25397 () (Array (_ BitVec 32) ValueCell!7493))

(assert (=> mapNonEmpty!25397 (= (arr!23025 _values!688) (store mapRest!25397 mapKey!25397 mapValue!25397))))

(declare-fun mapIsEmpty!25397 () Bool)

(assert (=> mapIsEmpty!25397 mapRes!25397))

(declare-fun b!845920 () Bool)

(declare-fun res!574403 () Bool)

(assert (=> b!845920 (=> (not res!574403) (not e!472309))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845920 (= res!574403 (and (= (size!23466 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23467 _keys!868) (size!23466 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845921 () Bool)

(assert (=> b!845921 (= e!472309 false)))

(declare-fun lt!381725 () Bool)

(declare-datatypes ((List!16221 0))(
  ( (Nil!16218) (Cons!16217 (h!17354 (_ BitVec 64)) (t!22584 List!16221)) )
))
(declare-fun arrayNoDuplicates!0 (array!47999 (_ BitVec 32) List!16221) Bool)

(assert (=> b!845921 (= lt!381725 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16218))))

(assert (= (and start!72982 res!574404) b!845916))

(assert (= (and b!845916 res!574405) b!845920))

(assert (= (and b!845920 res!574403) b!845918))

(assert (= (and b!845918 res!574402) b!845921))

(assert (= (and b!845915 condMapEmpty!25397) mapIsEmpty!25397))

(assert (= (and b!845915 (not condMapEmpty!25397)) mapNonEmpty!25397))

(get-info :version)

(assert (= (and mapNonEmpty!25397 ((_ is ValueCellFull!7493) mapValue!25397)) b!845917))

(assert (= (and b!845915 ((_ is ValueCellFull!7493) mapDefault!25397)) b!845919))

(assert (= start!72982 b!845915))

(declare-fun m!788309 () Bool)

(assert (=> mapNonEmpty!25397 m!788309))

(declare-fun m!788311 () Bool)

(assert (=> b!845921 m!788311))

(declare-fun m!788313 () Bool)

(assert (=> b!845918 m!788313))

(declare-fun m!788315 () Bool)

(assert (=> b!845916 m!788315))

(declare-fun m!788317 () Bool)

(assert (=> start!72982 m!788317))

(declare-fun m!788319 () Bool)

(assert (=> start!72982 m!788319))

(check-sat (not b!845918) (not mapNonEmpty!25397) tp_is_empty!15865 (not b!845916) (not b!845921) (not start!72982))
(check-sat)
