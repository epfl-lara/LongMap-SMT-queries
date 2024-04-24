; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20212 () Bool)

(assert start!20212)

(declare-fun b_free!4867 () Bool)

(declare-fun b_next!4867 () Bool)

(assert (=> start!20212 (= b_free!4867 (not b_next!4867))))

(declare-fun tp!17632 () Bool)

(declare-fun b_and!11627 () Bool)

(assert (=> start!20212 (= tp!17632 b_and!11627)))

(declare-fun res!94191 () Bool)

(declare-fun e!130504 () Bool)

(assert (=> start!20212 (=> (not res!94191) (not e!130504))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20212 (= res!94191 (validMask!0 mask!1149))))

(assert (=> start!20212 e!130504))

(declare-datatypes ((V!5945 0))(
  ( (V!5946 (val!2406 Int)) )
))
(declare-datatypes ((ValueCell!2018 0))(
  ( (ValueCellFull!2018 (v!4377 V!5945)) (EmptyCell!2018) )
))
(declare-datatypes ((array!8679 0))(
  ( (array!8680 (arr!4090 (Array (_ BitVec 32) ValueCell!2018)) (size!4415 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8679)

(declare-fun e!130506 () Bool)

(declare-fun array_inv!2667 (array!8679) Bool)

(assert (=> start!20212 (and (array_inv!2667 _values!649) e!130506)))

(assert (=> start!20212 true))

(declare-fun tp_is_empty!4723 () Bool)

(assert (=> start!20212 tp_is_empty!4723))

(declare-datatypes ((array!8681 0))(
  ( (array!8682 (arr!4091 (Array (_ BitVec 32) (_ BitVec 64))) (size!4416 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8681)

(declare-fun array_inv!2668 (array!8681) Bool)

(assert (=> start!20212 (array_inv!2668 _keys!825)))

(assert (=> start!20212 tp!17632))

(declare-fun b!198601 () Bool)

(declare-fun res!94189 () Bool)

(assert (=> b!198601 (=> (not res!94189) (not e!130504))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198601 (= res!94189 (and (= (size!4415 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4416 _keys!825) (size!4415 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198602 () Bool)

(declare-fun e!130507 () Bool)

(assert (=> b!198602 (= e!130507 tp_is_empty!4723)))

(declare-fun mapNonEmpty!8153 () Bool)

(declare-fun mapRes!8153 () Bool)

(declare-fun tp!17633 () Bool)

(assert (=> mapNonEmpty!8153 (= mapRes!8153 (and tp!17633 e!130507))))

(declare-fun mapKey!8153 () (_ BitVec 32))

(declare-fun mapRest!8153 () (Array (_ BitVec 32) ValueCell!2018))

(declare-fun mapValue!8153 () ValueCell!2018)

(assert (=> mapNonEmpty!8153 (= (arr!4090 _values!649) (store mapRest!8153 mapKey!8153 mapValue!8153))))

(declare-fun b!198603 () Bool)

(assert (=> b!198603 (= e!130504 (not true))))

(declare-datatypes ((tuple2!3590 0))(
  ( (tuple2!3591 (_1!1806 (_ BitVec 64)) (_2!1806 V!5945)) )
))
(declare-datatypes ((List!2510 0))(
  ( (Nil!2507) (Cons!2506 (h!3148 tuple2!3590) (t!7433 List!2510)) )
))
(declare-datatypes ((ListLongMap!2505 0))(
  ( (ListLongMap!2506 (toList!1268 List!2510)) )
))
(declare-fun lt!98005 () ListLongMap!2505)

(declare-fun lt!98006 () ListLongMap!2505)

(assert (=> b!198603 (and (= lt!98005 lt!98006) (= lt!98006 lt!98005))))

(declare-fun v!520 () V!5945)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!98003 () ListLongMap!2505)

(declare-fun +!322 (ListLongMap!2505 tuple2!3590) ListLongMap!2505)

(assert (=> b!198603 (= lt!98006 (+!322 lt!98003 (tuple2!3591 k0!843 v!520)))))

(declare-datatypes ((Unit!5930 0))(
  ( (Unit!5931) )
))
(declare-fun lt!98004 () Unit!5930)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5945)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5945)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!1 (array!8681 array!8679 (_ BitVec 32) (_ BitVec 32) V!5945 V!5945 (_ BitVec 32) (_ BitVec 64) V!5945 (_ BitVec 32) Int) Unit!5930)

(assert (=> b!198603 (= lt!98004 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!1 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!258 (array!8681 array!8679 (_ BitVec 32) (_ BitVec 32) V!5945 V!5945 (_ BitVec 32) Int) ListLongMap!2505)

(assert (=> b!198603 (= lt!98005 (getCurrentListMapNoExtraKeys!258 _keys!825 (array!8680 (store (arr!4090 _values!649) i!601 (ValueCellFull!2018 v!520)) (size!4415 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198603 (= lt!98003 (getCurrentListMapNoExtraKeys!258 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198604 () Bool)

(declare-fun e!130505 () Bool)

(assert (=> b!198604 (= e!130505 tp_is_empty!4723)))

(declare-fun b!198605 () Bool)

(declare-fun res!94193 () Bool)

(assert (=> b!198605 (=> (not res!94193) (not e!130504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198605 (= res!94193 (validKeyInArray!0 k0!843))))

(declare-fun b!198606 () Bool)

(declare-fun res!94194 () Bool)

(assert (=> b!198606 (=> (not res!94194) (not e!130504))))

(assert (=> b!198606 (= res!94194 (= (select (arr!4091 _keys!825) i!601) k0!843))))

(declare-fun b!198607 () Bool)

(declare-fun res!94192 () Bool)

(assert (=> b!198607 (=> (not res!94192) (not e!130504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8681 (_ BitVec 32)) Bool)

(assert (=> b!198607 (= res!94192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8153 () Bool)

(assert (=> mapIsEmpty!8153 mapRes!8153))

(declare-fun b!198608 () Bool)

(declare-fun res!94195 () Bool)

(assert (=> b!198608 (=> (not res!94195) (not e!130504))))

(declare-datatypes ((List!2511 0))(
  ( (Nil!2508) (Cons!2507 (h!3149 (_ BitVec 64)) (t!7434 List!2511)) )
))
(declare-fun arrayNoDuplicates!0 (array!8681 (_ BitVec 32) List!2511) Bool)

(assert (=> b!198608 (= res!94195 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2508))))

(declare-fun b!198609 () Bool)

(declare-fun res!94190 () Bool)

(assert (=> b!198609 (=> (not res!94190) (not e!130504))))

(assert (=> b!198609 (= res!94190 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4416 _keys!825))))))

(declare-fun b!198610 () Bool)

(assert (=> b!198610 (= e!130506 (and e!130505 mapRes!8153))))

(declare-fun condMapEmpty!8153 () Bool)

(declare-fun mapDefault!8153 () ValueCell!2018)

(assert (=> b!198610 (= condMapEmpty!8153 (= (arr!4090 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2018)) mapDefault!8153)))))

(assert (= (and start!20212 res!94191) b!198601))

(assert (= (and b!198601 res!94189) b!198607))

(assert (= (and b!198607 res!94192) b!198608))

(assert (= (and b!198608 res!94195) b!198609))

(assert (= (and b!198609 res!94190) b!198605))

(assert (= (and b!198605 res!94193) b!198606))

(assert (= (and b!198606 res!94194) b!198603))

(assert (= (and b!198610 condMapEmpty!8153) mapIsEmpty!8153))

(assert (= (and b!198610 (not condMapEmpty!8153)) mapNonEmpty!8153))

(get-info :version)

(assert (= (and mapNonEmpty!8153 ((_ is ValueCellFull!2018) mapValue!8153)) b!198602))

(assert (= (and b!198610 ((_ is ValueCellFull!2018) mapDefault!8153)) b!198604))

(assert (= start!20212 b!198610))

(declare-fun m!225315 () Bool)

(assert (=> b!198607 m!225315))

(declare-fun m!225317 () Bool)

(assert (=> b!198605 m!225317))

(declare-fun m!225319 () Bool)

(assert (=> b!198606 m!225319))

(declare-fun m!225321 () Bool)

(assert (=> b!198603 m!225321))

(declare-fun m!225323 () Bool)

(assert (=> b!198603 m!225323))

(declare-fun m!225325 () Bool)

(assert (=> b!198603 m!225325))

(declare-fun m!225327 () Bool)

(assert (=> b!198603 m!225327))

(declare-fun m!225329 () Bool)

(assert (=> b!198603 m!225329))

(declare-fun m!225331 () Bool)

(assert (=> mapNonEmpty!8153 m!225331))

(declare-fun m!225333 () Bool)

(assert (=> start!20212 m!225333))

(declare-fun m!225335 () Bool)

(assert (=> start!20212 m!225335))

(declare-fun m!225337 () Bool)

(assert (=> start!20212 m!225337))

(declare-fun m!225339 () Bool)

(assert (=> b!198608 m!225339))

(check-sat b_and!11627 tp_is_empty!4723 (not mapNonEmpty!8153) (not b_next!4867) (not start!20212) (not b!198607) (not b!198603) (not b!198608) (not b!198605))
(check-sat b_and!11627 (not b_next!4867))
