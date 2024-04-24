; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20266 () Bool)

(assert start!20266)

(declare-fun b_free!4921 () Bool)

(declare-fun b_next!4921 () Bool)

(assert (=> start!20266 (= b_free!4921 (not b_next!4921))))

(declare-fun tp!17795 () Bool)

(declare-fun b_and!11681 () Bool)

(assert (=> start!20266 (= tp!17795 b_and!11681)))

(declare-fun mapNonEmpty!8234 () Bool)

(declare-fun mapRes!8234 () Bool)

(declare-fun tp!17794 () Bool)

(declare-fun e!130910 () Bool)

(assert (=> mapNonEmpty!8234 (= mapRes!8234 (and tp!17794 e!130910))))

(declare-fun mapKey!8234 () (_ BitVec 32))

(declare-datatypes ((V!6017 0))(
  ( (V!6018 (val!2433 Int)) )
))
(declare-datatypes ((ValueCell!2045 0))(
  ( (ValueCellFull!2045 (v!4404 V!6017)) (EmptyCell!2045) )
))
(declare-fun mapValue!8234 () ValueCell!2045)

(declare-datatypes ((array!8783 0))(
  ( (array!8784 (arr!4142 (Array (_ BitVec 32) ValueCell!2045)) (size!4467 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8783)

(declare-fun mapRest!8234 () (Array (_ BitVec 32) ValueCell!2045))

(assert (=> mapNonEmpty!8234 (= (arr!4142 _values!649) (store mapRest!8234 mapKey!8234 mapValue!8234))))

(declare-fun b!199411 () Bool)

(declare-fun tp_is_empty!4777 () Bool)

(assert (=> b!199411 (= e!130910 tp_is_empty!4777)))

(declare-fun b!199412 () Bool)

(declare-fun res!94761 () Bool)

(declare-fun e!130912 () Bool)

(assert (=> b!199412 (=> (not res!94761) (not e!130912))))

(declare-datatypes ((array!8785 0))(
  ( (array!8786 (arr!4143 (Array (_ BitVec 32) (_ BitVec 64))) (size!4468 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8785)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199412 (= res!94761 (= (select (arr!4143 _keys!825) i!601) k0!843))))

(declare-fun b!199413 () Bool)

(declare-fun res!94758 () Bool)

(assert (=> b!199413 (=> (not res!94758) (not e!130912))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8785 (_ BitVec 32)) Bool)

(assert (=> b!199413 (= res!94758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!94760 () Bool)

(assert (=> start!20266 (=> (not res!94760) (not e!130912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20266 (= res!94760 (validMask!0 mask!1149))))

(assert (=> start!20266 e!130912))

(declare-fun e!130913 () Bool)

(declare-fun array_inv!2703 (array!8783) Bool)

(assert (=> start!20266 (and (array_inv!2703 _values!649) e!130913)))

(assert (=> start!20266 true))

(assert (=> start!20266 tp_is_empty!4777))

(declare-fun array_inv!2704 (array!8785) Bool)

(assert (=> start!20266 (array_inv!2704 _keys!825)))

(assert (=> start!20266 tp!17795))

(declare-fun mapIsEmpty!8234 () Bool)

(assert (=> mapIsEmpty!8234 mapRes!8234))

(declare-fun b!199414 () Bool)

(declare-fun res!94762 () Bool)

(assert (=> b!199414 (=> (not res!94762) (not e!130912))))

(assert (=> b!199414 (= res!94762 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4468 _keys!825))))))

(declare-fun b!199415 () Bool)

(declare-fun res!94757 () Bool)

(assert (=> b!199415 (=> (not res!94757) (not e!130912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199415 (= res!94757 (validKeyInArray!0 k0!843))))

(declare-fun b!199416 () Bool)

(declare-fun e!130909 () Bool)

(assert (=> b!199416 (= e!130913 (and e!130909 mapRes!8234))))

(declare-fun condMapEmpty!8234 () Bool)

(declare-fun mapDefault!8234 () ValueCell!2045)

(assert (=> b!199416 (= condMapEmpty!8234 (= (arr!4142 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2045)) mapDefault!8234)))))

(declare-fun b!199417 () Bool)

(assert (=> b!199417 (= e!130912 (not true))))

(declare-fun lt!98333 () array!8783)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6017)

(declare-fun zeroValue!615 () V!6017)

(declare-datatypes ((tuple2!3622 0))(
  ( (tuple2!3623 (_1!1822 (_ BitVec 64)) (_2!1822 V!6017)) )
))
(declare-datatypes ((List!2543 0))(
  ( (Nil!2540) (Cons!2539 (h!3181 tuple2!3622) (t!7466 List!2543)) )
))
(declare-datatypes ((ListLongMap!2537 0))(
  ( (ListLongMap!2538 (toList!1284 List!2543)) )
))
(declare-fun lt!98334 () ListLongMap!2537)

(declare-fun getCurrentListMap!881 (array!8785 array!8783 (_ BitVec 32) (_ BitVec 32) V!6017 V!6017 (_ BitVec 32) Int) ListLongMap!2537)

(assert (=> b!199417 (= lt!98334 (getCurrentListMap!881 _keys!825 lt!98333 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98331 () ListLongMap!2537)

(declare-fun lt!98336 () ListLongMap!2537)

(assert (=> b!199417 (and (= lt!98331 lt!98336) (= lt!98336 lt!98331))))

(declare-fun lt!98332 () ListLongMap!2537)

(declare-fun v!520 () V!6017)

(declare-fun +!338 (ListLongMap!2537 tuple2!3622) ListLongMap!2537)

(assert (=> b!199417 (= lt!98336 (+!338 lt!98332 (tuple2!3623 k0!843 v!520)))))

(declare-datatypes ((Unit!5962 0))(
  ( (Unit!5963) )
))
(declare-fun lt!98335 () Unit!5962)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!17 (array!8785 array!8783 (_ BitVec 32) (_ BitVec 32) V!6017 V!6017 (_ BitVec 32) (_ BitVec 64) V!6017 (_ BitVec 32) Int) Unit!5962)

(assert (=> b!199417 (= lt!98335 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!17 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!274 (array!8785 array!8783 (_ BitVec 32) (_ BitVec 32) V!6017 V!6017 (_ BitVec 32) Int) ListLongMap!2537)

(assert (=> b!199417 (= lt!98331 (getCurrentListMapNoExtraKeys!274 _keys!825 lt!98333 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199417 (= lt!98333 (array!8784 (store (arr!4142 _values!649) i!601 (ValueCellFull!2045 v!520)) (size!4467 _values!649)))))

(assert (=> b!199417 (= lt!98332 (getCurrentListMapNoExtraKeys!274 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199418 () Bool)

(declare-fun res!94756 () Bool)

(assert (=> b!199418 (=> (not res!94756) (not e!130912))))

(assert (=> b!199418 (= res!94756 (and (= (size!4467 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4468 _keys!825) (size!4467 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199419 () Bool)

(assert (=> b!199419 (= e!130909 tp_is_empty!4777)))

(declare-fun b!199420 () Bool)

(declare-fun res!94759 () Bool)

(assert (=> b!199420 (=> (not res!94759) (not e!130912))))

(declare-datatypes ((List!2544 0))(
  ( (Nil!2541) (Cons!2540 (h!3182 (_ BitVec 64)) (t!7467 List!2544)) )
))
(declare-fun arrayNoDuplicates!0 (array!8785 (_ BitVec 32) List!2544) Bool)

(assert (=> b!199420 (= res!94759 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2541))))

(assert (= (and start!20266 res!94760) b!199418))

(assert (= (and b!199418 res!94756) b!199413))

(assert (= (and b!199413 res!94758) b!199420))

(assert (= (and b!199420 res!94759) b!199414))

(assert (= (and b!199414 res!94762) b!199415))

(assert (= (and b!199415 res!94757) b!199412))

(assert (= (and b!199412 res!94761) b!199417))

(assert (= (and b!199416 condMapEmpty!8234) mapIsEmpty!8234))

(assert (= (and b!199416 (not condMapEmpty!8234)) mapNonEmpty!8234))

(get-info :version)

(assert (= (and mapNonEmpty!8234 ((_ is ValueCellFull!2045) mapValue!8234)) b!199411))

(assert (= (and b!199416 ((_ is ValueCellFull!2045) mapDefault!8234)) b!199419))

(assert (= start!20266 b!199416))

(declare-fun m!226017 () Bool)

(assert (=> b!199415 m!226017))

(declare-fun m!226019 () Bool)

(assert (=> b!199420 m!226019))

(declare-fun m!226021 () Bool)

(assert (=> b!199412 m!226021))

(declare-fun m!226023 () Bool)

(assert (=> b!199417 m!226023))

(declare-fun m!226025 () Bool)

(assert (=> b!199417 m!226025))

(declare-fun m!226027 () Bool)

(assert (=> b!199417 m!226027))

(declare-fun m!226029 () Bool)

(assert (=> b!199417 m!226029))

(declare-fun m!226031 () Bool)

(assert (=> b!199417 m!226031))

(declare-fun m!226033 () Bool)

(assert (=> b!199417 m!226033))

(declare-fun m!226035 () Bool)

(assert (=> start!20266 m!226035))

(declare-fun m!226037 () Bool)

(assert (=> start!20266 m!226037))

(declare-fun m!226039 () Bool)

(assert (=> start!20266 m!226039))

(declare-fun m!226041 () Bool)

(assert (=> mapNonEmpty!8234 m!226041))

(declare-fun m!226043 () Bool)

(assert (=> b!199413 m!226043))

(check-sat (not b!199420) (not b!199413) (not start!20266) tp_is_empty!4777 (not b!199417) (not mapNonEmpty!8234) (not b_next!4921) (not b!199415) b_and!11681)
(check-sat b_and!11681 (not b_next!4921))
