; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20488 () Bool)

(assert start!20488)

(declare-fun b_free!5143 () Bool)

(declare-fun b_next!5143 () Bool)

(assert (=> start!20488 (= b_free!5143 (not b_next!5143))))

(declare-fun tp!18460 () Bool)

(declare-fun b_and!11903 () Bool)

(assert (=> start!20488 (= tp!18460 b_and!11903)))

(declare-fun b!203258 () Bool)

(declare-fun res!97612 () Bool)

(declare-fun e!133076 () Bool)

(assert (=> b!203258 (=> (not res!97612) (not e!133076))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9209 0))(
  ( (array!9210 (arr!4355 (Array (_ BitVec 32) (_ BitVec 64))) (size!4680 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9209)

(assert (=> b!203258 (= res!97612 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4680 _keys!825))))))

(declare-fun b!203259 () Bool)

(declare-fun res!97605 () Bool)

(assert (=> b!203259 (=> (not res!97605) (not e!133076))))

(declare-datatypes ((List!2696 0))(
  ( (Nil!2693) (Cons!2692 (h!3334 (_ BitVec 64)) (t!7619 List!2696)) )
))
(declare-fun arrayNoDuplicates!0 (array!9209 (_ BitVec 32) List!2696) Bool)

(assert (=> b!203259 (= res!97605 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2693))))

(declare-fun b!203261 () Bool)

(declare-fun res!97606 () Bool)

(assert (=> b!203261 (=> (not res!97606) (not e!133076))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6313 0))(
  ( (V!6314 (val!2544 Int)) )
))
(declare-datatypes ((ValueCell!2156 0))(
  ( (ValueCellFull!2156 (v!4515 V!6313)) (EmptyCell!2156) )
))
(declare-datatypes ((array!9211 0))(
  ( (array!9212 (arr!4356 (Array (_ BitVec 32) ValueCell!2156)) (size!4681 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9211)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!203261 (= res!97606 (and (= (size!4681 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4680 _keys!825) (size!4681 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203262 () Bool)

(declare-fun e!133079 () Bool)

(declare-fun e!133075 () Bool)

(assert (=> b!203262 (= e!133079 e!133075)))

(declare-fun res!97610 () Bool)

(assert (=> b!203262 (=> res!97610 e!133075)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!203262 (= res!97610 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3794 0))(
  ( (tuple2!3795 (_1!1908 (_ BitVec 64)) (_2!1908 V!6313)) )
))
(declare-datatypes ((List!2697 0))(
  ( (Nil!2694) (Cons!2693 (h!3335 tuple2!3794) (t!7620 List!2697)) )
))
(declare-datatypes ((ListLongMap!2709 0))(
  ( (ListLongMap!2710 (toList!1370 List!2697)) )
))
(declare-fun lt!102447 () ListLongMap!2709)

(declare-fun lt!102450 () ListLongMap!2709)

(assert (=> b!203262 (= lt!102447 lt!102450)))

(declare-fun lt!102458 () ListLongMap!2709)

(declare-fun lt!102448 () tuple2!3794)

(declare-fun +!424 (ListLongMap!2709 tuple2!3794) ListLongMap!2709)

(assert (=> b!203262 (= lt!102450 (+!424 lt!102458 lt!102448))))

(declare-fun lt!102456 () ListLongMap!2709)

(declare-fun lt!102454 () ListLongMap!2709)

(assert (=> b!203262 (= lt!102456 lt!102454)))

(declare-fun lt!102453 () ListLongMap!2709)

(assert (=> b!203262 (= lt!102454 (+!424 lt!102453 lt!102448))))

(declare-fun lt!102452 () ListLongMap!2709)

(assert (=> b!203262 (= lt!102447 (+!424 lt!102452 lt!102448))))

(declare-fun zeroValue!615 () V!6313)

(assert (=> b!203262 (= lt!102448 (tuple2!3795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8567 () Bool)

(declare-fun mapRes!8567 () Bool)

(declare-fun tp!18461 () Bool)

(declare-fun e!133074 () Bool)

(assert (=> mapNonEmpty!8567 (= mapRes!8567 (and tp!18461 e!133074))))

(declare-fun mapKey!8567 () (_ BitVec 32))

(declare-fun mapRest!8567 () (Array (_ BitVec 32) ValueCell!2156))

(declare-fun mapValue!8567 () ValueCell!2156)

(assert (=> mapNonEmpty!8567 (= (arr!4356 _values!649) (store mapRest!8567 mapKey!8567 mapValue!8567))))

(declare-fun b!203263 () Bool)

(declare-fun res!97611 () Bool)

(assert (=> b!203263 (=> (not res!97611) (not e!133076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203263 (= res!97611 (validKeyInArray!0 k0!843))))

(declare-fun b!203264 () Bool)

(declare-fun tp_is_empty!4999 () Bool)

(assert (=> b!203264 (= e!133074 tp_is_empty!4999)))

(declare-fun b!203265 () Bool)

(assert (=> b!203265 (= e!133076 (not e!133079))))

(declare-fun res!97609 () Bool)

(assert (=> b!203265 (=> res!97609 e!133079)))

(assert (=> b!203265 (= res!97609 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6313)

(declare-fun getCurrentListMap!952 (array!9209 array!9211 (_ BitVec 32) (_ BitVec 32) V!6313 V!6313 (_ BitVec 32) Int) ListLongMap!2709)

(assert (=> b!203265 (= lt!102456 (getCurrentListMap!952 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102451 () array!9211)

(assert (=> b!203265 (= lt!102447 (getCurrentListMap!952 _keys!825 lt!102451 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203265 (and (= lt!102452 lt!102458) (= lt!102458 lt!102452))))

(declare-fun lt!102457 () tuple2!3794)

(assert (=> b!203265 (= lt!102458 (+!424 lt!102453 lt!102457))))

(declare-fun v!520 () V!6313)

(assert (=> b!203265 (= lt!102457 (tuple2!3795 k0!843 v!520))))

(declare-datatypes ((Unit!6132 0))(
  ( (Unit!6133) )
))
(declare-fun lt!102449 () Unit!6132)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!88 (array!9209 array!9211 (_ BitVec 32) (_ BitVec 32) V!6313 V!6313 (_ BitVec 32) (_ BitVec 64) V!6313 (_ BitVec 32) Int) Unit!6132)

(assert (=> b!203265 (= lt!102449 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!88 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!345 (array!9209 array!9211 (_ BitVec 32) (_ BitVec 32) V!6313 V!6313 (_ BitVec 32) Int) ListLongMap!2709)

(assert (=> b!203265 (= lt!102452 (getCurrentListMapNoExtraKeys!345 _keys!825 lt!102451 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203265 (= lt!102451 (array!9212 (store (arr!4356 _values!649) i!601 (ValueCellFull!2156 v!520)) (size!4681 _values!649)))))

(assert (=> b!203265 (= lt!102453 (getCurrentListMapNoExtraKeys!345 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203266 () Bool)

(assert (=> b!203266 (= e!133075 true)))

(assert (=> b!203266 (= lt!102450 (+!424 lt!102454 lt!102457))))

(declare-fun lt!102455 () Unit!6132)

(declare-fun addCommutativeForDiffKeys!142 (ListLongMap!2709 (_ BitVec 64) V!6313 (_ BitVec 64) V!6313) Unit!6132)

(assert (=> b!203266 (= lt!102455 (addCommutativeForDiffKeys!142 lt!102453 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203267 () Bool)

(declare-fun res!97608 () Bool)

(assert (=> b!203267 (=> (not res!97608) (not e!133076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9209 (_ BitVec 32)) Bool)

(assert (=> b!203267 (= res!97608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203268 () Bool)

(declare-fun e!133077 () Bool)

(assert (=> b!203268 (= e!133077 tp_is_empty!4999)))

(declare-fun mapIsEmpty!8567 () Bool)

(assert (=> mapIsEmpty!8567 mapRes!8567))

(declare-fun b!203269 () Bool)

(declare-fun res!97607 () Bool)

(assert (=> b!203269 (=> (not res!97607) (not e!133076))))

(assert (=> b!203269 (= res!97607 (= (select (arr!4355 _keys!825) i!601) k0!843))))

(declare-fun res!97604 () Bool)

(assert (=> start!20488 (=> (not res!97604) (not e!133076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20488 (= res!97604 (validMask!0 mask!1149))))

(assert (=> start!20488 e!133076))

(declare-fun e!133073 () Bool)

(declare-fun array_inv!2845 (array!9211) Bool)

(assert (=> start!20488 (and (array_inv!2845 _values!649) e!133073)))

(assert (=> start!20488 true))

(assert (=> start!20488 tp_is_empty!4999))

(declare-fun array_inv!2846 (array!9209) Bool)

(assert (=> start!20488 (array_inv!2846 _keys!825)))

(assert (=> start!20488 tp!18460))

(declare-fun b!203260 () Bool)

(assert (=> b!203260 (= e!133073 (and e!133077 mapRes!8567))))

(declare-fun condMapEmpty!8567 () Bool)

(declare-fun mapDefault!8567 () ValueCell!2156)

(assert (=> b!203260 (= condMapEmpty!8567 (= (arr!4356 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2156)) mapDefault!8567)))))

(assert (= (and start!20488 res!97604) b!203261))

(assert (= (and b!203261 res!97606) b!203267))

(assert (= (and b!203267 res!97608) b!203259))

(assert (= (and b!203259 res!97605) b!203258))

(assert (= (and b!203258 res!97612) b!203263))

(assert (= (and b!203263 res!97611) b!203269))

(assert (= (and b!203269 res!97607) b!203265))

(assert (= (and b!203265 (not res!97609)) b!203262))

(assert (= (and b!203262 (not res!97610)) b!203266))

(assert (= (and b!203260 condMapEmpty!8567) mapIsEmpty!8567))

(assert (= (and b!203260 (not condMapEmpty!8567)) mapNonEmpty!8567))

(get-info :version)

(assert (= (and mapNonEmpty!8567 ((_ is ValueCellFull!2156) mapValue!8567)) b!203264))

(assert (= (and b!203260 ((_ is ValueCellFull!2156) mapDefault!8567)) b!203268))

(assert (= start!20488 b!203260))

(declare-fun m!230793 () Bool)

(assert (=> b!203267 m!230793))

(declare-fun m!230795 () Bool)

(assert (=> b!203262 m!230795))

(declare-fun m!230797 () Bool)

(assert (=> b!203262 m!230797))

(declare-fun m!230799 () Bool)

(assert (=> b!203262 m!230799))

(declare-fun m!230801 () Bool)

(assert (=> b!203259 m!230801))

(declare-fun m!230803 () Bool)

(assert (=> mapNonEmpty!8567 m!230803))

(declare-fun m!230805 () Bool)

(assert (=> b!203266 m!230805))

(declare-fun m!230807 () Bool)

(assert (=> b!203266 m!230807))

(declare-fun m!230809 () Bool)

(assert (=> b!203265 m!230809))

(declare-fun m!230811 () Bool)

(assert (=> b!203265 m!230811))

(declare-fun m!230813 () Bool)

(assert (=> b!203265 m!230813))

(declare-fun m!230815 () Bool)

(assert (=> b!203265 m!230815))

(declare-fun m!230817 () Bool)

(assert (=> b!203265 m!230817))

(declare-fun m!230819 () Bool)

(assert (=> b!203265 m!230819))

(declare-fun m!230821 () Bool)

(assert (=> b!203265 m!230821))

(declare-fun m!230823 () Bool)

(assert (=> b!203269 m!230823))

(declare-fun m!230825 () Bool)

(assert (=> start!20488 m!230825))

(declare-fun m!230827 () Bool)

(assert (=> start!20488 m!230827))

(declare-fun m!230829 () Bool)

(assert (=> start!20488 m!230829))

(declare-fun m!230831 () Bool)

(assert (=> b!203263 m!230831))

(check-sat (not start!20488) tp_is_empty!4999 (not b!203259) (not mapNonEmpty!8567) (not b_next!5143) b_and!11903 (not b!203262) (not b!203266) (not b!203265) (not b!203263) (not b!203267))
(check-sat b_and!11903 (not b_next!5143))
