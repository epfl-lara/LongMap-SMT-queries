; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20242 () Bool)

(assert start!20242)

(declare-fun b_free!4897 () Bool)

(declare-fun b_next!4897 () Bool)

(assert (=> start!20242 (= b_free!4897 (not b_next!4897))))

(declare-fun tp!17722 () Bool)

(declare-fun b_and!11617 () Bool)

(assert (=> start!20242 (= tp!17722 b_and!11617)))

(declare-fun b!198857 () Bool)

(declare-fun res!94388 () Bool)

(declare-fun e!130605 () Bool)

(assert (=> b!198857 (=> (not res!94388) (not e!130605))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198857 (= res!94388 (validKeyInArray!0 k0!843))))

(declare-fun b!198858 () Bool)

(assert (=> b!198858 (= e!130605 (not true))))

(declare-datatypes ((V!5985 0))(
  ( (V!5986 (val!2421 Int)) )
))
(declare-datatypes ((tuple2!3628 0))(
  ( (tuple2!3629 (_1!1825 (_ BitVec 64)) (_2!1825 V!5985)) )
))
(declare-datatypes ((List!2560 0))(
  ( (Nil!2557) (Cons!2556 (h!3198 tuple2!3628) (t!7482 List!2560)) )
))
(declare-datatypes ((ListLongMap!2531 0))(
  ( (ListLongMap!2532 (toList!1281 List!2560)) )
))
(declare-fun lt!97946 () ListLongMap!2531)

(declare-fun lt!97945 () ListLongMap!2531)

(assert (=> b!198858 (and (= lt!97946 lt!97945) (= lt!97945 lt!97946))))

(declare-fun v!520 () V!5985)

(declare-fun lt!97943 () ListLongMap!2531)

(declare-fun +!330 (ListLongMap!2531 tuple2!3628) ListLongMap!2531)

(assert (=> b!198858 (= lt!97945 (+!330 lt!97943 (tuple2!3629 k0!843 v!520)))))

(declare-datatypes ((Unit!5912 0))(
  ( (Unit!5913) )
))
(declare-fun lt!97944 () Unit!5912)

(declare-datatypes ((ValueCell!2033 0))(
  ( (ValueCellFull!2033 (v!4385 V!5985)) (EmptyCell!2033) )
))
(declare-datatypes ((array!8727 0))(
  ( (array!8728 (arr!4113 (Array (_ BitVec 32) ValueCell!2033)) (size!4439 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8727)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5985)

(declare-datatypes ((array!8729 0))(
  ( (array!8730 (arr!4114 (Array (_ BitVec 32) (_ BitVec 64))) (size!4440 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8729)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5985)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!10 (array!8729 array!8727 (_ BitVec 32) (_ BitVec 32) V!5985 V!5985 (_ BitVec 32) (_ BitVec 64) V!5985 (_ BitVec 32) Int) Unit!5912)

(assert (=> b!198858 (= lt!97944 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!10 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!261 (array!8729 array!8727 (_ BitVec 32) (_ BitVec 32) V!5985 V!5985 (_ BitVec 32) Int) ListLongMap!2531)

(assert (=> b!198858 (= lt!97946 (getCurrentListMapNoExtraKeys!261 _keys!825 (array!8728 (store (arr!4113 _values!649) i!601 (ValueCellFull!2033 v!520)) (size!4439 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198858 (= lt!97943 (getCurrentListMapNoExtraKeys!261 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8198 () Bool)

(declare-fun mapRes!8198 () Bool)

(declare-fun tp!17723 () Bool)

(declare-fun e!130608 () Bool)

(assert (=> mapNonEmpty!8198 (= mapRes!8198 (and tp!17723 e!130608))))

(declare-fun mapRest!8198 () (Array (_ BitVec 32) ValueCell!2033))

(declare-fun mapValue!8198 () ValueCell!2033)

(declare-fun mapKey!8198 () (_ BitVec 32))

(assert (=> mapNonEmpty!8198 (= (arr!4113 _values!649) (store mapRest!8198 mapKey!8198 mapValue!8198))))

(declare-fun b!198859 () Bool)

(declare-fun res!94390 () Bool)

(assert (=> b!198859 (=> (not res!94390) (not e!130605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8729 (_ BitVec 32)) Bool)

(assert (=> b!198859 (= res!94390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198860 () Bool)

(declare-fun res!94391 () Bool)

(assert (=> b!198860 (=> (not res!94391) (not e!130605))))

(assert (=> b!198860 (= res!94391 (and (= (size!4439 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4440 _keys!825) (size!4439 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198861 () Bool)

(declare-fun e!130604 () Bool)

(declare-fun tp_is_empty!4753 () Bool)

(assert (=> b!198861 (= e!130604 tp_is_empty!4753)))

(declare-fun b!198862 () Bool)

(declare-fun res!94393 () Bool)

(assert (=> b!198862 (=> (not res!94393) (not e!130605))))

(assert (=> b!198862 (= res!94393 (= (select (arr!4114 _keys!825) i!601) k0!843))))

(declare-fun res!94394 () Bool)

(assert (=> start!20242 (=> (not res!94394) (not e!130605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20242 (= res!94394 (validMask!0 mask!1149))))

(assert (=> start!20242 e!130605))

(declare-fun e!130607 () Bool)

(declare-fun array_inv!2681 (array!8727) Bool)

(assert (=> start!20242 (and (array_inv!2681 _values!649) e!130607)))

(assert (=> start!20242 true))

(assert (=> start!20242 tp_is_empty!4753))

(declare-fun array_inv!2682 (array!8729) Bool)

(assert (=> start!20242 (array_inv!2682 _keys!825)))

(assert (=> start!20242 tp!17722))

(declare-fun mapIsEmpty!8198 () Bool)

(assert (=> mapIsEmpty!8198 mapRes!8198))

(declare-fun b!198863 () Bool)

(assert (=> b!198863 (= e!130607 (and e!130604 mapRes!8198))))

(declare-fun condMapEmpty!8198 () Bool)

(declare-fun mapDefault!8198 () ValueCell!2033)

(assert (=> b!198863 (= condMapEmpty!8198 (= (arr!4113 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2033)) mapDefault!8198)))))

(declare-fun b!198864 () Bool)

(declare-fun res!94392 () Bool)

(assert (=> b!198864 (=> (not res!94392) (not e!130605))))

(assert (=> b!198864 (= res!94392 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4440 _keys!825))))))

(declare-fun b!198865 () Bool)

(declare-fun res!94389 () Bool)

(assert (=> b!198865 (=> (not res!94389) (not e!130605))))

(declare-datatypes ((List!2561 0))(
  ( (Nil!2558) (Cons!2557 (h!3199 (_ BitVec 64)) (t!7483 List!2561)) )
))
(declare-fun arrayNoDuplicates!0 (array!8729 (_ BitVec 32) List!2561) Bool)

(assert (=> b!198865 (= res!94389 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2558))))

(declare-fun b!198866 () Bool)

(assert (=> b!198866 (= e!130608 tp_is_empty!4753)))

(assert (= (and start!20242 res!94394) b!198860))

(assert (= (and b!198860 res!94391) b!198859))

(assert (= (and b!198859 res!94390) b!198865))

(assert (= (and b!198865 res!94389) b!198864))

(assert (= (and b!198864 res!94392) b!198857))

(assert (= (and b!198857 res!94388) b!198862))

(assert (= (and b!198862 res!94393) b!198858))

(assert (= (and b!198863 condMapEmpty!8198) mapIsEmpty!8198))

(assert (= (and b!198863 (not condMapEmpty!8198)) mapNonEmpty!8198))

(get-info :version)

(assert (= (and mapNonEmpty!8198 ((_ is ValueCellFull!2033) mapValue!8198)) b!198866))

(assert (= (and b!198863 ((_ is ValueCellFull!2033) mapDefault!8198)) b!198861))

(assert (= start!20242 b!198863))

(declare-fun m!224907 () Bool)

(assert (=> b!198859 m!224907))

(declare-fun m!224909 () Bool)

(assert (=> b!198862 m!224909))

(declare-fun m!224911 () Bool)

(assert (=> b!198857 m!224911))

(declare-fun m!224913 () Bool)

(assert (=> b!198865 m!224913))

(declare-fun m!224915 () Bool)

(assert (=> mapNonEmpty!8198 m!224915))

(declare-fun m!224917 () Bool)

(assert (=> b!198858 m!224917))

(declare-fun m!224919 () Bool)

(assert (=> b!198858 m!224919))

(declare-fun m!224921 () Bool)

(assert (=> b!198858 m!224921))

(declare-fun m!224923 () Bool)

(assert (=> b!198858 m!224923))

(declare-fun m!224925 () Bool)

(assert (=> b!198858 m!224925))

(declare-fun m!224927 () Bool)

(assert (=> start!20242 m!224927))

(declare-fun m!224929 () Bool)

(assert (=> start!20242 m!224929))

(declare-fun m!224931 () Bool)

(assert (=> start!20242 m!224931))

(check-sat b_and!11617 (not b_next!4897) (not start!20242) (not b!198858) (not b!198857) (not b!198859) tp_is_empty!4753 (not b!198865) (not mapNonEmpty!8198))
(check-sat b_and!11617 (not b_next!4897))
