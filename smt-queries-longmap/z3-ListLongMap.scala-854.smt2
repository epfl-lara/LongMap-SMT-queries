; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20224 () Bool)

(assert start!20224)

(declare-fun b_free!4879 () Bool)

(declare-fun b_next!4879 () Bool)

(assert (=> start!20224 (= b_free!4879 (not b_next!4879))))

(declare-fun tp!17668 () Bool)

(declare-fun b_and!11599 () Bool)

(assert (=> start!20224 (= tp!17668 b_and!11599)))

(declare-fun b!198587 () Bool)

(declare-fun res!94201 () Bool)

(declare-fun e!130472 () Bool)

(assert (=> b!198587 (=> (not res!94201) (not e!130472))))

(declare-datatypes ((array!8695 0))(
  ( (array!8696 (arr!4097 (Array (_ BitVec 32) (_ BitVec 64))) (size!4423 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8695)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8695 (_ BitVec 32)) Bool)

(assert (=> b!198587 (= res!94201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198588 () Bool)

(declare-fun res!94199 () Bool)

(assert (=> b!198588 (=> (not res!94199) (not e!130472))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5961 0))(
  ( (V!5962 (val!2412 Int)) )
))
(declare-datatypes ((ValueCell!2024 0))(
  ( (ValueCellFull!2024 (v!4376 V!5961)) (EmptyCell!2024) )
))
(declare-datatypes ((array!8697 0))(
  ( (array!8698 (arr!4098 (Array (_ BitVec 32) ValueCell!2024)) (size!4424 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8697)

(assert (=> b!198588 (= res!94199 (and (= (size!4424 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4423 _keys!825) (size!4424 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8171 () Bool)

(declare-fun mapRes!8171 () Bool)

(assert (=> mapIsEmpty!8171 mapRes!8171))

(declare-fun b!198589 () Bool)

(declare-fun e!130471 () Bool)

(declare-fun e!130469 () Bool)

(assert (=> b!198589 (= e!130471 (and e!130469 mapRes!8171))))

(declare-fun condMapEmpty!8171 () Bool)

(declare-fun mapDefault!8171 () ValueCell!2024)

(assert (=> b!198589 (= condMapEmpty!8171 (= (arr!4098 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2024)) mapDefault!8171)))))

(declare-fun b!198590 () Bool)

(declare-fun res!94202 () Bool)

(assert (=> b!198590 (=> (not res!94202) (not e!130472))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198590 (= res!94202 (= (select (arr!4097 _keys!825) i!601) k0!843))))

(declare-fun b!198591 () Bool)

(declare-fun e!130473 () Bool)

(declare-fun tp_is_empty!4735 () Bool)

(assert (=> b!198591 (= e!130473 tp_is_empty!4735)))

(declare-fun b!198592 () Bool)

(declare-fun res!94203 () Bool)

(assert (=> b!198592 (=> (not res!94203) (not e!130472))))

(declare-datatypes ((List!2550 0))(
  ( (Nil!2547) (Cons!2546 (h!3188 (_ BitVec 64)) (t!7472 List!2550)) )
))
(declare-fun arrayNoDuplicates!0 (array!8695 (_ BitVec 32) List!2550) Bool)

(assert (=> b!198592 (= res!94203 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2547))))

(declare-fun b!198593 () Bool)

(declare-fun res!94200 () Bool)

(assert (=> b!198593 (=> (not res!94200) (not e!130472))))

(assert (=> b!198593 (= res!94200 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4423 _keys!825))))))

(declare-fun b!198595 () Bool)

(assert (=> b!198595 (= e!130469 tp_is_empty!4735)))

(declare-fun b!198596 () Bool)

(declare-fun res!94204 () Bool)

(assert (=> b!198596 (=> (not res!94204) (not e!130472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198596 (= res!94204 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8171 () Bool)

(declare-fun tp!17669 () Bool)

(assert (=> mapNonEmpty!8171 (= mapRes!8171 (and tp!17669 e!130473))))

(declare-fun mapRest!8171 () (Array (_ BitVec 32) ValueCell!2024))

(declare-fun mapValue!8171 () ValueCell!2024)

(declare-fun mapKey!8171 () (_ BitVec 32))

(assert (=> mapNonEmpty!8171 (= (arr!4098 _values!649) (store mapRest!8171 mapKey!8171 mapValue!8171))))

(declare-fun b!198594 () Bool)

(assert (=> b!198594 (= e!130472 (not true))))

(declare-datatypes ((tuple2!3618 0))(
  ( (tuple2!3619 (_1!1820 (_ BitVec 64)) (_2!1820 V!5961)) )
))
(declare-datatypes ((List!2551 0))(
  ( (Nil!2548) (Cons!2547 (h!3189 tuple2!3618) (t!7473 List!2551)) )
))
(declare-datatypes ((ListLongMap!2521 0))(
  ( (ListLongMap!2522 (toList!1276 List!2551)) )
))
(declare-fun lt!97836 () ListLongMap!2521)

(declare-fun lt!97838 () ListLongMap!2521)

(assert (=> b!198594 (and (= lt!97836 lt!97838) (= lt!97838 lt!97836))))

(declare-fun lt!97837 () ListLongMap!2521)

(declare-fun v!520 () V!5961)

(declare-fun +!325 (ListLongMap!2521 tuple2!3618) ListLongMap!2521)

(assert (=> b!198594 (= lt!97838 (+!325 lt!97837 (tuple2!3619 k0!843 v!520)))))

(declare-datatypes ((Unit!5902 0))(
  ( (Unit!5903) )
))
(declare-fun lt!97835 () Unit!5902)

(declare-fun zeroValue!615 () V!5961)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5961)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!5 (array!8695 array!8697 (_ BitVec 32) (_ BitVec 32) V!5961 V!5961 (_ BitVec 32) (_ BitVec 64) V!5961 (_ BitVec 32) Int) Unit!5902)

(assert (=> b!198594 (= lt!97835 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!5 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!256 (array!8695 array!8697 (_ BitVec 32) (_ BitVec 32) V!5961 V!5961 (_ BitVec 32) Int) ListLongMap!2521)

(assert (=> b!198594 (= lt!97836 (getCurrentListMapNoExtraKeys!256 _keys!825 (array!8698 (store (arr!4098 _values!649) i!601 (ValueCellFull!2024 v!520)) (size!4424 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198594 (= lt!97837 (getCurrentListMapNoExtraKeys!256 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!94205 () Bool)

(assert (=> start!20224 (=> (not res!94205) (not e!130472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20224 (= res!94205 (validMask!0 mask!1149))))

(assert (=> start!20224 e!130472))

(declare-fun array_inv!2671 (array!8697) Bool)

(assert (=> start!20224 (and (array_inv!2671 _values!649) e!130471)))

(assert (=> start!20224 true))

(assert (=> start!20224 tp_is_empty!4735))

(declare-fun array_inv!2672 (array!8695) Bool)

(assert (=> start!20224 (array_inv!2672 _keys!825)))

(assert (=> start!20224 tp!17668))

(assert (= (and start!20224 res!94205) b!198588))

(assert (= (and b!198588 res!94199) b!198587))

(assert (= (and b!198587 res!94201) b!198592))

(assert (= (and b!198592 res!94203) b!198593))

(assert (= (and b!198593 res!94200) b!198596))

(assert (= (and b!198596 res!94204) b!198590))

(assert (= (and b!198590 res!94202) b!198594))

(assert (= (and b!198589 condMapEmpty!8171) mapIsEmpty!8171))

(assert (= (and b!198589 (not condMapEmpty!8171)) mapNonEmpty!8171))

(get-info :version)

(assert (= (and mapNonEmpty!8171 ((_ is ValueCellFull!2024) mapValue!8171)) b!198591))

(assert (= (and b!198589 ((_ is ValueCellFull!2024) mapDefault!8171)) b!198595))

(assert (= start!20224 b!198589))

(declare-fun m!224673 () Bool)

(assert (=> start!20224 m!224673))

(declare-fun m!224675 () Bool)

(assert (=> start!20224 m!224675))

(declare-fun m!224677 () Bool)

(assert (=> start!20224 m!224677))

(declare-fun m!224679 () Bool)

(assert (=> b!198594 m!224679))

(declare-fun m!224681 () Bool)

(assert (=> b!198594 m!224681))

(declare-fun m!224683 () Bool)

(assert (=> b!198594 m!224683))

(declare-fun m!224685 () Bool)

(assert (=> b!198594 m!224685))

(declare-fun m!224687 () Bool)

(assert (=> b!198594 m!224687))

(declare-fun m!224689 () Bool)

(assert (=> b!198587 m!224689))

(declare-fun m!224691 () Bool)

(assert (=> b!198596 m!224691))

(declare-fun m!224693 () Bool)

(assert (=> mapNonEmpty!8171 m!224693))

(declare-fun m!224695 () Bool)

(assert (=> b!198592 m!224695))

(declare-fun m!224697 () Bool)

(assert (=> b!198590 m!224697))

(check-sat (not b!198592) tp_is_empty!4735 (not b_next!4879) (not mapNonEmpty!8171) (not b!198587) (not start!20224) (not b!198596) (not b!198594) b_and!11599)
(check-sat b_and!11599 (not b_next!4879))
