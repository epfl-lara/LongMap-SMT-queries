; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37784 () Bool)

(assert start!37784)

(declare-fun b_free!8887 () Bool)

(declare-fun b_next!8887 () Bool)

(assert (=> start!37784 (= b_free!8887 (not b_next!8887))))

(declare-fun tp!31412 () Bool)

(declare-fun b_and!16129 () Bool)

(assert (=> start!37784 (= tp!31412 b_and!16129)))

(declare-fun b!388001 () Bool)

(declare-fun res!221811 () Bool)

(declare-fun e!235150 () Bool)

(assert (=> b!388001 (=> (not res!221811) (not e!235150))))

(declare-datatypes ((array!23009 0))(
  ( (array!23010 (arr!10973 (Array (_ BitVec 32) (_ BitVec 64))) (size!11325 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23009)

(declare-datatypes ((List!6336 0))(
  ( (Nil!6333) (Cons!6332 (h!7188 (_ BitVec 64)) (t!11486 List!6336)) )
))
(declare-fun arrayNoDuplicates!0 (array!23009 (_ BitVec 32) List!6336) Bool)

(assert (=> b!388001 (= res!221811 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6333))))

(declare-fun mapNonEmpty!15903 () Bool)

(declare-fun mapRes!15903 () Bool)

(declare-fun tp!31413 () Bool)

(declare-fun e!235149 () Bool)

(assert (=> mapNonEmpty!15903 (= mapRes!15903 (and tp!31413 e!235149))))

(declare-datatypes ((V!13851 0))(
  ( (V!13852 (val!4824 Int)) )
))
(declare-datatypes ((ValueCell!4436 0))(
  ( (ValueCellFull!4436 (v!7021 V!13851)) (EmptyCell!4436) )
))
(declare-datatypes ((array!23011 0))(
  ( (array!23012 (arr!10974 (Array (_ BitVec 32) ValueCell!4436)) (size!11326 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23011)

(declare-fun mapKey!15903 () (_ BitVec 32))

(declare-fun mapRest!15903 () (Array (_ BitVec 32) ValueCell!4436))

(declare-fun mapValue!15903 () ValueCell!4436)

(assert (=> mapNonEmpty!15903 (= (arr!10974 _values!506) (store mapRest!15903 mapKey!15903 mapValue!15903))))

(declare-fun b!388002 () Bool)

(declare-fun e!235151 () Bool)

(declare-fun tp_is_empty!9559 () Bool)

(assert (=> b!388002 (= e!235151 tp_is_empty!9559)))

(declare-fun b!388003 () Bool)

(declare-fun e!235152 () Bool)

(assert (=> b!388003 (= e!235150 e!235152)))

(declare-fun res!221815 () Bool)

(assert (=> b!388003 (=> (not res!221815) (not e!235152))))

(declare-fun lt!182175 () array!23009)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23009 (_ BitVec 32)) Bool)

(assert (=> b!388003 (= res!221815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182175 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388003 (= lt!182175 (array!23010 (store (arr!10973 _keys!658) i!548 k!778) (size!11325 _keys!658)))))

(declare-fun b!388004 () Bool)

(declare-datatypes ((tuple2!6484 0))(
  ( (tuple2!6485 (_1!3253 (_ BitVec 64)) (_2!3253 V!13851)) )
))
(declare-datatypes ((List!6337 0))(
  ( (Nil!6334) (Cons!6333 (h!7189 tuple2!6484) (t!11487 List!6337)) )
))
(declare-datatypes ((ListLongMap!5397 0))(
  ( (ListLongMap!5398 (toList!2714 List!6337)) )
))
(declare-fun lt!182174 () ListLongMap!5397)

(declare-fun lt!182172 () ListLongMap!5397)

(assert (=> b!388004 (= e!235152 (not (= lt!182174 lt!182172)))))

(assert (=> b!388004 (= lt!182172 lt!182174)))

(declare-fun v!373 () V!13851)

(declare-fun lt!182171 () ListLongMap!5397)

(declare-fun +!1009 (ListLongMap!5397 tuple2!6484) ListLongMap!5397)

(assert (=> b!388004 (= lt!182174 (+!1009 lt!182171 (tuple2!6485 k!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13851)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((Unit!11892 0))(
  ( (Unit!11893) )
))
(declare-fun lt!182173 () Unit!11892)

(declare-fun minValue!472 () V!13851)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!227 (array!23009 array!23011 (_ BitVec 32) (_ BitVec 32) V!13851 V!13851 (_ BitVec 32) (_ BitVec 64) V!13851 (_ BitVec 32) Int) Unit!11892)

(assert (=> b!388004 (= lt!182173 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!227 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!943 (array!23009 array!23011 (_ BitVec 32) (_ BitVec 32) V!13851 V!13851 (_ BitVec 32) Int) ListLongMap!5397)

(assert (=> b!388004 (= lt!182172 (getCurrentListMapNoExtraKeys!943 lt!182175 (array!23012 (store (arr!10974 _values!506) i!548 (ValueCellFull!4436 v!373)) (size!11326 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388004 (= lt!182171 (getCurrentListMapNoExtraKeys!943 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388005 () Bool)

(declare-fun res!221812 () Bool)

(assert (=> b!388005 (=> (not res!221812) (not e!235150))))

(declare-fun arrayContainsKey!0 (array!23009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388005 (= res!221812 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!388006 () Bool)

(declare-fun res!221807 () Bool)

(assert (=> b!388006 (=> (not res!221807) (not e!235150))))

(assert (=> b!388006 (= res!221807 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11325 _keys!658))))))

(declare-fun res!221808 () Bool)

(assert (=> start!37784 (=> (not res!221808) (not e!235150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37784 (= res!221808 (validMask!0 mask!970))))

(assert (=> start!37784 e!235150))

(declare-fun e!235153 () Bool)

(declare-fun array_inv!8068 (array!23011) Bool)

(assert (=> start!37784 (and (array_inv!8068 _values!506) e!235153)))

(assert (=> start!37784 tp!31412))

(assert (=> start!37784 true))

(assert (=> start!37784 tp_is_empty!9559))

(declare-fun array_inv!8069 (array!23009) Bool)

(assert (=> start!37784 (array_inv!8069 _keys!658)))

(declare-fun b!388007 () Bool)

(declare-fun res!221813 () Bool)

(assert (=> b!388007 (=> (not res!221813) (not e!235150))))

(assert (=> b!388007 (= res!221813 (or (= (select (arr!10973 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10973 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388008 () Bool)

(declare-fun res!221816 () Bool)

(assert (=> b!388008 (=> (not res!221816) (not e!235150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388008 (= res!221816 (validKeyInArray!0 k!778))))

(declare-fun b!388009 () Bool)

(declare-fun res!221809 () Bool)

(assert (=> b!388009 (=> (not res!221809) (not e!235152))))

(assert (=> b!388009 (= res!221809 (arrayNoDuplicates!0 lt!182175 #b00000000000000000000000000000000 Nil!6333))))

(declare-fun b!388010 () Bool)

(assert (=> b!388010 (= e!235149 tp_is_empty!9559)))

(declare-fun b!388011 () Bool)

(declare-fun res!221814 () Bool)

(assert (=> b!388011 (=> (not res!221814) (not e!235150))))

(assert (=> b!388011 (= res!221814 (and (= (size!11326 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11325 _keys!658) (size!11326 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15903 () Bool)

(assert (=> mapIsEmpty!15903 mapRes!15903))

(declare-fun b!388012 () Bool)

(declare-fun res!221810 () Bool)

(assert (=> b!388012 (=> (not res!221810) (not e!235150))))

(assert (=> b!388012 (= res!221810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388013 () Bool)

(assert (=> b!388013 (= e!235153 (and e!235151 mapRes!15903))))

(declare-fun condMapEmpty!15903 () Bool)

(declare-fun mapDefault!15903 () ValueCell!4436)

