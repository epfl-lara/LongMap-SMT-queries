; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37452 () Bool)

(assert start!37452)

(declare-fun b_free!8579 () Bool)

(declare-fun b_next!8579 () Bool)

(assert (=> start!37452 (= b_free!8579 (not b_next!8579))))

(declare-fun tp!30453 () Bool)

(declare-fun b_and!15821 () Bool)

(assert (=> start!37452 (= tp!30453 b_and!15821)))

(declare-fun b!381436 () Bool)

(declare-fun e!231902 () Bool)

(declare-fun e!231900 () Bool)

(assert (=> b!381436 (= e!231902 (not e!231900))))

(declare-fun res!216740 () Bool)

(assert (=> b!381436 (=> res!216740 e!231900)))

(declare-fun lt!178780 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381436 (= res!216740 (or (and (not lt!178780) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178780) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178780)))))

(assert (=> b!381436 (= lt!178780 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13407 0))(
  ( (V!13408 (val!4658 Int)) )
))
(declare-datatypes ((tuple2!6256 0))(
  ( (tuple2!6257 (_1!3139 (_ BitVec 64)) (_2!3139 V!13407)) )
))
(declare-datatypes ((List!6087 0))(
  ( (Nil!6084) (Cons!6083 (h!6939 tuple2!6256) (t!11237 List!6087)) )
))
(declare-datatypes ((ListLongMap!5169 0))(
  ( (ListLongMap!5170 (toList!2600 List!6087)) )
))
(declare-fun lt!178777 () ListLongMap!5169)

(declare-datatypes ((ValueCell!4270 0))(
  ( (ValueCellFull!4270 (v!6855 V!13407)) (EmptyCell!4270) )
))
(declare-datatypes ((array!22369 0))(
  ( (array!22370 (arr!10653 (Array (_ BitVec 32) ValueCell!4270)) (size!11005 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22369)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13407)

(declare-datatypes ((array!22371 0))(
  ( (array!22372 (arr!10654 (Array (_ BitVec 32) (_ BitVec 64))) (size!11006 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22371)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13407)

(declare-fun getCurrentListMap!2013 (array!22371 array!22369 (_ BitVec 32) (_ BitVec 32) V!13407 V!13407 (_ BitVec 32) Int) ListLongMap!5169)

(assert (=> b!381436 (= lt!178777 (getCurrentListMap!2013 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178783 () array!22369)

(declare-fun lt!178784 () ListLongMap!5169)

(declare-fun lt!178778 () array!22371)

(assert (=> b!381436 (= lt!178784 (getCurrentListMap!2013 lt!178778 lt!178783 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178779 () ListLongMap!5169)

(declare-fun lt!178781 () ListLongMap!5169)

(assert (=> b!381436 (and (= lt!178779 lt!178781) (= lt!178781 lt!178779))))

(declare-fun v!373 () V!13407)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun lt!178782 () ListLongMap!5169)

(declare-fun +!943 (ListLongMap!5169 tuple2!6256) ListLongMap!5169)

(assert (=> b!381436 (= lt!178781 (+!943 lt!178782 (tuple2!6257 k!778 v!373)))))

(declare-datatypes ((Unit!11780 0))(
  ( (Unit!11781) )
))
(declare-fun lt!178785 () Unit!11780)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!171 (array!22371 array!22369 (_ BitVec 32) (_ BitVec 32) V!13407 V!13407 (_ BitVec 32) (_ BitVec 64) V!13407 (_ BitVec 32) Int) Unit!11780)

(assert (=> b!381436 (= lt!178785 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!171 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!847 (array!22371 array!22369 (_ BitVec 32) (_ BitVec 32) V!13407 V!13407 (_ BitVec 32) Int) ListLongMap!5169)

(assert (=> b!381436 (= lt!178779 (getCurrentListMapNoExtraKeys!847 lt!178778 lt!178783 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381436 (= lt!178783 (array!22370 (store (arr!10653 _values!506) i!548 (ValueCellFull!4270 v!373)) (size!11005 _values!506)))))

(assert (=> b!381436 (= lt!178782 (getCurrentListMapNoExtraKeys!847 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381437 () Bool)

(declare-fun res!216739 () Bool)

(declare-fun e!231905 () Bool)

(assert (=> b!381437 (=> (not res!216739) (not e!231905))))

(assert (=> b!381437 (= res!216739 (or (= (select (arr!10654 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10654 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381438 () Bool)

(declare-fun res!216737 () Bool)

(assert (=> b!381438 (=> (not res!216737) (not e!231905))))

(declare-datatypes ((List!6088 0))(
  ( (Nil!6085) (Cons!6084 (h!6940 (_ BitVec 64)) (t!11238 List!6088)) )
))
(declare-fun arrayNoDuplicates!0 (array!22371 (_ BitVec 32) List!6088) Bool)

(assert (=> b!381438 (= res!216737 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6085))))

(declare-fun mapNonEmpty!15405 () Bool)

(declare-fun mapRes!15405 () Bool)

(declare-fun tp!30452 () Bool)

(declare-fun e!231901 () Bool)

(assert (=> mapNonEmpty!15405 (= mapRes!15405 (and tp!30452 e!231901))))

(declare-fun mapValue!15405 () ValueCell!4270)

(declare-fun mapRest!15405 () (Array (_ BitVec 32) ValueCell!4270))

(declare-fun mapKey!15405 () (_ BitVec 32))

(assert (=> mapNonEmpty!15405 (= (arr!10653 _values!506) (store mapRest!15405 mapKey!15405 mapValue!15405))))

(declare-fun res!216738 () Bool)

(assert (=> start!37452 (=> (not res!216738) (not e!231905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37452 (= res!216738 (validMask!0 mask!970))))

(assert (=> start!37452 e!231905))

(declare-fun e!231904 () Bool)

(declare-fun array_inv!7844 (array!22369) Bool)

(assert (=> start!37452 (and (array_inv!7844 _values!506) e!231904)))

(assert (=> start!37452 tp!30453))

(assert (=> start!37452 true))

(declare-fun tp_is_empty!9227 () Bool)

(assert (=> start!37452 tp_is_empty!9227))

(declare-fun array_inv!7845 (array!22371) Bool)

(assert (=> start!37452 (array_inv!7845 _keys!658)))

(declare-fun b!381439 () Bool)

(declare-fun res!216744 () Bool)

(assert (=> b!381439 (=> (not res!216744) (not e!231905))))

(assert (=> b!381439 (= res!216744 (and (= (size!11005 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11006 _keys!658) (size!11005 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381440 () Bool)

(declare-fun e!231903 () Bool)

(assert (=> b!381440 (= e!231903 tp_is_empty!9227)))

(declare-fun b!381441 () Bool)

(assert (=> b!381441 (= e!231905 e!231902)))

(declare-fun res!216745 () Bool)

(assert (=> b!381441 (=> (not res!216745) (not e!231902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22371 (_ BitVec 32)) Bool)

(assert (=> b!381441 (= res!216745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178778 mask!970))))

(assert (=> b!381441 (= lt!178778 (array!22372 (store (arr!10654 _keys!658) i!548 k!778) (size!11006 _keys!658)))))

(declare-fun b!381442 () Bool)

(assert (=> b!381442 (= e!231901 tp_is_empty!9227)))

(declare-fun b!381443 () Bool)

(assert (=> b!381443 (= e!231900 true)))

(assert (=> b!381443 (= lt!178784 lt!178779)))

(declare-fun b!381444 () Bool)

(declare-fun res!216741 () Bool)

(assert (=> b!381444 (=> (not res!216741) (not e!231902))))

(assert (=> b!381444 (= res!216741 (arrayNoDuplicates!0 lt!178778 #b00000000000000000000000000000000 Nil!6085))))

(declare-fun b!381445 () Bool)

(declare-fun res!216746 () Bool)

(assert (=> b!381445 (=> (not res!216746) (not e!231905))))

(assert (=> b!381445 (= res!216746 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11006 _keys!658))))))

(declare-fun b!381446 () Bool)

(declare-fun res!216736 () Bool)

(assert (=> b!381446 (=> (not res!216736) (not e!231905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381446 (= res!216736 (validKeyInArray!0 k!778))))

(declare-fun b!381447 () Bool)

(declare-fun res!216742 () Bool)

(assert (=> b!381447 (=> (not res!216742) (not e!231905))))

(assert (=> b!381447 (= res!216742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15405 () Bool)

(assert (=> mapIsEmpty!15405 mapRes!15405))

(declare-fun b!381448 () Bool)

(declare-fun res!216743 () Bool)

(assert (=> b!381448 (=> (not res!216743) (not e!231905))))

(declare-fun arrayContainsKey!0 (array!22371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381448 (= res!216743 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!381449 () Bool)

(assert (=> b!381449 (= e!231904 (and e!231903 mapRes!15405))))

(declare-fun condMapEmpty!15405 () Bool)

(declare-fun mapDefault!15405 () ValueCell!4270)

