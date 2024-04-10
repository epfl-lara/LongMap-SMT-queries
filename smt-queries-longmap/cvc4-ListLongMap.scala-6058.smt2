; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78398 () Bool)

(assert start!78398)

(declare-fun b_free!16763 () Bool)

(declare-fun b_next!16763 () Bool)

(assert (=> start!78398 (= b_free!16763 (not b_next!16763))))

(declare-fun tp!58576 () Bool)

(declare-fun b_and!27383 () Bool)

(assert (=> start!78398 (= tp!58576 b_and!27383)))

(declare-fun b!914606 () Bool)

(declare-fun e!513101 () Bool)

(declare-fun tp_is_empty!19181 () Bool)

(assert (=> b!914606 (= e!513101 tp_is_empty!19181)))

(declare-fun b!914607 () Bool)

(declare-fun res!616808 () Bool)

(declare-fun e!513098 () Bool)

(assert (=> b!914607 (=> (not res!616808) (not e!513098))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!914607 (= res!616808 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!30510 () Bool)

(declare-fun mapRes!30510 () Bool)

(assert (=> mapIsEmpty!30510 mapRes!30510))

(declare-fun b!914608 () Bool)

(declare-fun e!513096 () Bool)

(assert (=> b!914608 (= e!513098 e!513096)))

(declare-fun c!96012 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!914608 (= c!96012 (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914610 () Bool)

(declare-fun res!616813 () Bool)

(declare-fun e!513104 () Bool)

(assert (=> b!914610 (=> (not res!616813) (not e!513104))))

(declare-datatypes ((V!30539 0))(
  ( (V!30540 (val!9641 Int)) )
))
(declare-datatypes ((ValueCell!9109 0))(
  ( (ValueCellFull!9109 (v!12157 V!30539)) (EmptyCell!9109) )
))
(declare-datatypes ((array!54352 0))(
  ( (array!54353 (arr!26127 (Array (_ BitVec 32) ValueCell!9109)) (size!26586 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54352)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((array!54354 0))(
  ( (array!54355 (arr!26128 (Array (_ BitVec 32) (_ BitVec 64))) (size!26587 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54354)

(assert (=> b!914610 (= res!616813 (and (= (size!26586 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26587 _keys!1386) (size!26586 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!914611 () Bool)

(assert (=> b!914611 (= e!513104 e!513098)))

(declare-fun res!616812 () Bool)

(assert (=> b!914611 (=> (not res!616812) (not e!513098))))

(declare-datatypes ((tuple2!12570 0))(
  ( (tuple2!12571 (_1!6296 (_ BitVec 64)) (_2!6296 V!30539)) )
))
(declare-datatypes ((List!18357 0))(
  ( (Nil!18354) (Cons!18353 (h!19499 tuple2!12570) (t!25968 List!18357)) )
))
(declare-datatypes ((ListLongMap!11267 0))(
  ( (ListLongMap!11268 (toList!5649 List!18357)) )
))
(declare-fun lt!411498 () ListLongMap!11267)

(declare-fun contains!4699 (ListLongMap!11267 (_ BitVec 64)) Bool)

(assert (=> b!914611 (= res!616812 (contains!4699 lt!411498 k!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30539)

(declare-fun minValue!1094 () V!30539)

(declare-fun getCurrentListMap!2910 (array!54354 array!54352 (_ BitVec 32) (_ BitVec 32) V!30539 V!30539 (_ BitVec 32) Int) ListLongMap!11267)

(assert (=> b!914611 (= lt!411498 (getCurrentListMap!2910 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!914612 () Bool)

(declare-fun e!513100 () Bool)

(declare-fun call!40510 () V!30539)

(assert (=> b!914612 (= e!513100 (not (= call!40510 minValue!1094)))))

(declare-fun b!914613 () Bool)

(declare-fun e!513103 () Bool)

(assert (=> b!914613 (= e!513096 e!513103)))

(declare-fun res!616816 () Bool)

(assert (=> b!914613 (= res!616816 (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!914613 (=> res!616816 e!513103)))

(declare-fun b!914614 () Bool)

(declare-fun res!616811 () Bool)

(assert (=> b!914614 (=> (not res!616811) (not e!513104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54354 (_ BitVec 32)) Bool)

(assert (=> b!914614 (= res!616811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun bm!40507 () Bool)

(declare-fun apply!525 (ListLongMap!11267 (_ BitVec 64)) V!30539)

(assert (=> bm!40507 (= call!40510 (apply!525 lt!411498 k!1033))))

(declare-fun b!914615 () Bool)

(declare-fun e!513097 () Bool)

(assert (=> b!914615 (= e!513096 e!513097)))

(declare-fun res!616809 () Bool)

(assert (=> b!914615 (= res!616809 (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914615 (=> (not res!616809) (not e!513097))))

(declare-fun b!914616 () Bool)

(declare-fun res!616810 () Bool)

(assert (=> b!914616 (=> (not res!616810) (not e!513104))))

(declare-datatypes ((List!18358 0))(
  ( (Nil!18355) (Cons!18354 (h!19500 (_ BitVec 64)) (t!25969 List!18358)) )
))
(declare-fun arrayNoDuplicates!0 (array!54354 (_ BitVec 32) List!18358) Bool)

(assert (=> b!914616 (= res!616810 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18355))))

(declare-fun b!914617 () Bool)

(declare-fun res!616815 () Bool)

(assert (=> b!914617 (= res!616815 (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(assert (=> b!914617 (=> res!616815 e!513100)))

(assert (=> b!914617 (= e!513097 e!513100)))

(declare-fun mapNonEmpty!30510 () Bool)

(declare-fun tp!58577 () Bool)

(assert (=> mapNonEmpty!30510 (= mapRes!30510 (and tp!58577 e!513101))))

(declare-fun mapValue!30510 () ValueCell!9109)

(declare-fun mapKey!30510 () (_ BitVec 32))

(declare-fun mapRest!30510 () (Array (_ BitVec 32) ValueCell!9109))

(assert (=> mapNonEmpty!30510 (= (arr!26127 _values!1152) (store mapRest!30510 mapKey!30510 mapValue!30510))))

(declare-fun b!914618 () Bool)

(declare-fun e!513102 () Bool)

(assert (=> b!914618 (= e!513102 tp_is_empty!19181)))

(declare-fun b!914609 () Bool)

(declare-fun res!616814 () Bool)

(assert (=> b!914609 (=> (not res!616814) (not e!513098))))

(assert (=> b!914609 (= res!616814 (and (= (select (arr!26128 _keys!1386) i!717) k!1033) (or (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!616817 () Bool)

(assert (=> start!78398 (=> (not res!616817) (not e!513104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78398 (= res!616817 (validMask!0 mask!1756))))

(assert (=> start!78398 e!513104))

(declare-fun e!513095 () Bool)

(declare-fun array_inv!20404 (array!54352) Bool)

(assert (=> start!78398 (and (array_inv!20404 _values!1152) e!513095)))

(assert (=> start!78398 tp!58576))

(assert (=> start!78398 true))

(assert (=> start!78398 tp_is_empty!19181))

(declare-fun array_inv!20405 (array!54354) Bool)

(assert (=> start!78398 (array_inv!20405 _keys!1386)))

(declare-fun b!914619 () Bool)

(assert (=> b!914619 (= e!513103 (not (= call!40510 zeroValue!1094)))))

(declare-fun b!914620 () Bool)

(assert (=> b!914620 (= e!513095 (and e!513102 mapRes!30510))))

(declare-fun condMapEmpty!30510 () Bool)

(declare-fun mapDefault!30510 () ValueCell!9109)

