; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72322 () Bool)

(assert start!72322)

(declare-fun b!837852 () Bool)

(declare-fun e!467696 () Bool)

(declare-fun e!467700 () Bool)

(declare-fun mapRes!24686 () Bool)

(assert (=> b!837852 (= e!467696 (and e!467700 mapRes!24686))))

(declare-fun condMapEmpty!24686 () Bool)

(declare-datatypes ((V!25569 0))(
  ( (V!25570 (val!7743 Int)) )
))
(declare-datatypes ((ValueCell!7256 0))(
  ( (ValueCellFull!7256 (v!10162 V!25569)) (EmptyCell!7256) )
))
(declare-datatypes ((array!47043 0))(
  ( (array!47044 (arr!22553 (Array (_ BitVec 32) ValueCell!7256)) (size!22995 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47043)

(declare-fun mapDefault!24686 () ValueCell!7256)

(assert (=> b!837852 (= condMapEmpty!24686 (= (arr!22553 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7256)) mapDefault!24686)))))

(declare-fun res!569808 () Bool)

(declare-fun e!467699 () Bool)

(assert (=> start!72322 (=> (not res!569808) (not e!467699))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47045 0))(
  ( (array!47046 (arr!22554 (Array (_ BitVec 32) (_ BitVec 64))) (size!22996 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47045)

(assert (=> start!72322 (= res!569808 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22996 _keys!868))))))

(assert (=> start!72322 e!467699))

(assert (=> start!72322 true))

(declare-fun array_inv!18040 (array!47045) Bool)

(assert (=> start!72322 (array_inv!18040 _keys!868)))

(declare-fun array_inv!18041 (array!47043) Bool)

(assert (=> start!72322 (and (array_inv!18041 _values!688) e!467696)))

(declare-fun b!837853 () Bool)

(declare-fun res!569810 () Bool)

(assert (=> b!837853 (=> (not res!569810) (not e!467699))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!837853 (= res!569810 (and (= (size!22995 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22996 _keys!868) (size!22995 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837854 () Bool)

(declare-fun res!569811 () Bool)

(assert (=> b!837854 (=> (not res!569811) (not e!467699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837854 (= res!569811 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!24686 () Bool)

(assert (=> mapIsEmpty!24686 mapRes!24686))

(declare-fun b!837855 () Bool)

(assert (=> b!837855 (= e!467699 false)))

(declare-fun lt!380417 () Bool)

(declare-datatypes ((List!16046 0))(
  ( (Nil!16043) (Cons!16042 (h!17173 (_ BitVec 64)) (t!22408 List!16046)) )
))
(declare-fun arrayNoDuplicates!0 (array!47045 (_ BitVec 32) List!16046) Bool)

(assert (=> b!837855 (= lt!380417 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16043))))

(declare-fun mapNonEmpty!24686 () Bool)

(declare-fun tp!47681 () Bool)

(declare-fun e!467698 () Bool)

(assert (=> mapNonEmpty!24686 (= mapRes!24686 (and tp!47681 e!467698))))

(declare-fun mapRest!24686 () (Array (_ BitVec 32) ValueCell!7256))

(declare-fun mapKey!24686 () (_ BitVec 32))

(declare-fun mapValue!24686 () ValueCell!7256)

(assert (=> mapNonEmpty!24686 (= (arr!22553 _values!688) (store mapRest!24686 mapKey!24686 mapValue!24686))))

(declare-fun b!837856 () Bool)

(declare-fun tp_is_empty!15391 () Bool)

(assert (=> b!837856 (= e!467698 tp_is_empty!15391)))

(declare-fun b!837857 () Bool)

(assert (=> b!837857 (= e!467700 tp_is_empty!15391)))

(declare-fun b!837858 () Bool)

(declare-fun res!569809 () Bool)

(assert (=> b!837858 (=> (not res!569809) (not e!467699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47045 (_ BitVec 32)) Bool)

(assert (=> b!837858 (= res!569809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72322 res!569808) b!837854))

(assert (= (and b!837854 res!569811) b!837853))

(assert (= (and b!837853 res!569810) b!837858))

(assert (= (and b!837858 res!569809) b!837855))

(assert (= (and b!837852 condMapEmpty!24686) mapIsEmpty!24686))

(assert (= (and b!837852 (not condMapEmpty!24686)) mapNonEmpty!24686))

(get-info :version)

(assert (= (and mapNonEmpty!24686 ((_ is ValueCellFull!7256) mapValue!24686)) b!837856))

(assert (= (and b!837852 ((_ is ValueCellFull!7256) mapDefault!24686)) b!837857))

(assert (= start!72322 b!837852))

(declare-fun m!781907 () Bool)

(assert (=> b!837854 m!781907))

(declare-fun m!781909 () Bool)

(assert (=> mapNonEmpty!24686 m!781909))

(declare-fun m!781911 () Bool)

(assert (=> b!837855 m!781911))

(declare-fun m!781913 () Bool)

(assert (=> start!72322 m!781913))

(declare-fun m!781915 () Bool)

(assert (=> start!72322 m!781915))

(declare-fun m!781917 () Bool)

(assert (=> b!837858 m!781917))

(check-sat tp_is_empty!15391 (not b!837854) (not start!72322) (not mapNonEmpty!24686) (not b!837855) (not b!837858))
(check-sat)
