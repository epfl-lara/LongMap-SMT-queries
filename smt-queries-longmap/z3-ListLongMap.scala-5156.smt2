; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70066 () Bool)

(assert start!70066)

(declare-fun res!555636 () Bool)

(declare-fun e!450761 () Bool)

(assert (=> start!70066 (=> (not res!555636) (not e!450761))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70066 (= res!555636 (validMask!0 mask!1312))))

(assert (=> start!70066 e!450761))

(declare-datatypes ((array!44329 0))(
  ( (array!44330 (arr!21222 (Array (_ BitVec 32) (_ BitVec 64))) (size!21642 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44329)

(declare-fun array_inv!17057 (array!44329) Bool)

(assert (=> start!70066 (array_inv!17057 _keys!976)))

(assert (=> start!70066 true))

(declare-datatypes ((V!23739 0))(
  ( (V!23740 (val!7074 Int)) )
))
(declare-datatypes ((ValueCell!6611 0))(
  ( (ValueCellFull!6611 (v!9501 V!23739)) (EmptyCell!6611) )
))
(declare-datatypes ((array!44331 0))(
  ( (array!44332 (arr!21223 (Array (_ BitVec 32) ValueCell!6611)) (size!21643 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44331)

(declare-fun e!450759 () Bool)

(declare-fun array_inv!17058 (array!44331) Bool)

(assert (=> start!70066 (and (array_inv!17058 _values!788) e!450759)))

(declare-fun b!813558 () Bool)

(assert (=> b!813558 (= e!450761 false)))

(declare-fun lt!364530 () Bool)

(declare-datatypes ((List!15006 0))(
  ( (Nil!15003) (Cons!15002 (h!16137 (_ BitVec 64)) (t!21313 List!15006)) )
))
(declare-fun arrayNoDuplicates!0 (array!44329 (_ BitVec 32) List!15006) Bool)

(assert (=> b!813558 (= lt!364530 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15003))))

(declare-fun mapIsEmpty!22654 () Bool)

(declare-fun mapRes!22654 () Bool)

(assert (=> mapIsEmpty!22654 mapRes!22654))

(declare-fun mapNonEmpty!22654 () Bool)

(declare-fun tp!43762 () Bool)

(declare-fun e!450757 () Bool)

(assert (=> mapNonEmpty!22654 (= mapRes!22654 (and tp!43762 e!450757))))

(declare-fun mapKey!22654 () (_ BitVec 32))

(declare-fun mapValue!22654 () ValueCell!6611)

(declare-fun mapRest!22654 () (Array (_ BitVec 32) ValueCell!6611))

(assert (=> mapNonEmpty!22654 (= (arr!21223 _values!788) (store mapRest!22654 mapKey!22654 mapValue!22654))))

(declare-fun b!813559 () Bool)

(declare-fun e!450760 () Bool)

(declare-fun tp_is_empty!14053 () Bool)

(assert (=> b!813559 (= e!450760 tp_is_empty!14053)))

(declare-fun b!813560 () Bool)

(assert (=> b!813560 (= e!450759 (and e!450760 mapRes!22654))))

(declare-fun condMapEmpty!22654 () Bool)

(declare-fun mapDefault!22654 () ValueCell!6611)

(assert (=> b!813560 (= condMapEmpty!22654 (= (arr!21223 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6611)) mapDefault!22654)))))

(declare-fun b!813561 () Bool)

(declare-fun res!555635 () Bool)

(assert (=> b!813561 (=> (not res!555635) (not e!450761))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813561 (= res!555635 (and (= (size!21643 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21642 _keys!976) (size!21643 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813562 () Bool)

(declare-fun res!555637 () Bool)

(assert (=> b!813562 (=> (not res!555637) (not e!450761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44329 (_ BitVec 32)) Bool)

(assert (=> b!813562 (= res!555637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813563 () Bool)

(assert (=> b!813563 (= e!450757 tp_is_empty!14053)))

(assert (= (and start!70066 res!555636) b!813561))

(assert (= (and b!813561 res!555635) b!813562))

(assert (= (and b!813562 res!555637) b!813558))

(assert (= (and b!813560 condMapEmpty!22654) mapIsEmpty!22654))

(assert (= (and b!813560 (not condMapEmpty!22654)) mapNonEmpty!22654))

(get-info :version)

(assert (= (and mapNonEmpty!22654 ((_ is ValueCellFull!6611) mapValue!22654)) b!813563))

(assert (= (and b!813560 ((_ is ValueCellFull!6611) mapDefault!22654)) b!813559))

(assert (= start!70066 b!813560))

(declare-fun m!756259 () Bool)

(assert (=> start!70066 m!756259))

(declare-fun m!756261 () Bool)

(assert (=> start!70066 m!756261))

(declare-fun m!756263 () Bool)

(assert (=> start!70066 m!756263))

(declare-fun m!756265 () Bool)

(assert (=> b!813558 m!756265))

(declare-fun m!756267 () Bool)

(assert (=> mapNonEmpty!22654 m!756267))

(declare-fun m!756269 () Bool)

(assert (=> b!813562 m!756269))

(check-sat tp_is_empty!14053 (not b!813558) (not mapNonEmpty!22654) (not b!813562) (not start!70066))
(check-sat)
