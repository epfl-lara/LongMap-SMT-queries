; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36816 () Bool)

(assert start!36816)

(declare-fun b_free!7943 () Bool)

(declare-fun b_next!7943 () Bool)

(assert (=> start!36816 (= b_free!7943 (not b_next!7943))))

(declare-fun tp!28544 () Bool)

(declare-fun b_and!15185 () Bool)

(assert (=> start!36816 (= tp!28544 b_and!15185)))

(declare-fun b!367928 () Bool)

(declare-fun res!206099 () Bool)

(declare-fun e!225100 () Bool)

(assert (=> b!367928 (=> (not res!206099) (not e!225100))))

(declare-datatypes ((array!21139 0))(
  ( (array!21140 (arr!10038 (Array (_ BitVec 32) (_ BitVec 64))) (size!10390 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21139)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21139 (_ BitVec 32)) Bool)

(assert (=> b!367928 (= res!206099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367929 () Bool)

(declare-fun res!206094 () Bool)

(declare-fun e!225097 () Bool)

(assert (=> b!367929 (=> (not res!206094) (not e!225097))))

(declare-fun lt!169451 () array!21139)

(declare-datatypes ((List!5578 0))(
  ( (Nil!5575) (Cons!5574 (h!6430 (_ BitVec 64)) (t!10728 List!5578)) )
))
(declare-fun arrayNoDuplicates!0 (array!21139 (_ BitVec 32) List!5578) Bool)

(assert (=> b!367929 (= res!206094 (arrayNoDuplicates!0 lt!169451 #b00000000000000000000000000000000 Nil!5575))))

(declare-fun b!367930 () Bool)

(declare-fun e!225096 () Bool)

(declare-fun tp_is_empty!8591 () Bool)

(assert (=> b!367930 (= e!225096 tp_is_empty!8591)))

(declare-fun b!367931 () Bool)

(declare-fun res!206096 () Bool)

(assert (=> b!367931 (=> (not res!206096) (not e!225100))))

(assert (=> b!367931 (= res!206096 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5575))))

(declare-fun res!206092 () Bool)

(assert (=> start!36816 (=> (not res!206092) (not e!225100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36816 (= res!206092 (validMask!0 mask!970))))

(assert (=> start!36816 e!225100))

(assert (=> start!36816 true))

(declare-datatypes ((V!12559 0))(
  ( (V!12560 (val!4340 Int)) )
))
(declare-datatypes ((ValueCell!3952 0))(
  ( (ValueCellFull!3952 (v!6537 V!12559)) (EmptyCell!3952) )
))
(declare-datatypes ((array!21141 0))(
  ( (array!21142 (arr!10039 (Array (_ BitVec 32) ValueCell!3952)) (size!10391 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21141)

(declare-fun e!225099 () Bool)

(declare-fun array_inv!7424 (array!21141) Bool)

(assert (=> start!36816 (and (array_inv!7424 _values!506) e!225099)))

(assert (=> start!36816 tp!28544))

(assert (=> start!36816 tp_is_empty!8591))

(declare-fun array_inv!7425 (array!21139) Bool)

(assert (=> start!36816 (array_inv!7425 _keys!658)))

(declare-fun b!367932 () Bool)

(assert (=> b!367932 (= e!225097 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12559)

(declare-datatypes ((tuple2!5746 0))(
  ( (tuple2!5747 (_1!2884 (_ BitVec 64)) (_2!2884 V!12559)) )
))
(declare-datatypes ((List!5579 0))(
  ( (Nil!5576) (Cons!5575 (h!6431 tuple2!5746) (t!10729 List!5579)) )
))
(declare-datatypes ((ListLongMap!4659 0))(
  ( (ListLongMap!4660 (toList!2345 List!5579)) )
))
(declare-fun lt!169452 () ListLongMap!4659)

(declare-fun minValue!472 () V!12559)

(declare-fun getCurrentListMapNoExtraKeys!622 (array!21139 array!21141 (_ BitVec 32) (_ BitVec 32) V!12559 V!12559 (_ BitVec 32) Int) ListLongMap!4659)

(assert (=> b!367932 (= lt!169452 (getCurrentListMapNoExtraKeys!622 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!367933 () Bool)

(declare-fun e!225101 () Bool)

(assert (=> b!367933 (= e!225101 tp_is_empty!8591)))

(declare-fun b!367934 () Bool)

(declare-fun res!206091 () Bool)

(assert (=> b!367934 (=> (not res!206091) (not e!225100))))

(assert (=> b!367934 (= res!206091 (and (= (size!10391 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10390 _keys!658) (size!10391 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367935 () Bool)

(declare-fun res!206093 () Bool)

(assert (=> b!367935 (=> (not res!206093) (not e!225100))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367935 (= res!206093 (or (= (select (arr!10038 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10038 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367936 () Bool)

(declare-fun res!206090 () Bool)

(assert (=> b!367936 (=> (not res!206090) (not e!225100))))

(assert (=> b!367936 (= res!206090 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10390 _keys!658))))))

(declare-fun b!367937 () Bool)

(declare-fun mapRes!14451 () Bool)

(assert (=> b!367937 (= e!225099 (and e!225101 mapRes!14451))))

(declare-fun condMapEmpty!14451 () Bool)

(declare-fun mapDefault!14451 () ValueCell!3952)

