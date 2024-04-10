; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37128 () Bool)

(assert start!37128)

(declare-fun b_free!8255 () Bool)

(declare-fun b_next!8255 () Bool)

(assert (=> start!37128 (= b_free!8255 (not b_next!8255))))

(declare-fun tp!29481 () Bool)

(declare-fun b_and!15497 () Bool)

(assert (=> start!37128 (= tp!29481 b_and!15497)))

(declare-fun b!374172 () Bool)

(declare-fun e!228058 () Bool)

(assert (=> b!374172 (= e!228058 true)))

(declare-datatypes ((V!12975 0))(
  ( (V!12976 (val!4496 Int)) )
))
(declare-datatypes ((tuple2!5976 0))(
  ( (tuple2!5977 (_1!2999 (_ BitVec 64)) (_2!2999 V!12975)) )
))
(declare-fun lt!172313 () tuple2!5976)

(declare-datatypes ((List!5821 0))(
  ( (Nil!5818) (Cons!5817 (h!6673 tuple2!5976) (t!10971 List!5821)) )
))
(declare-datatypes ((ListLongMap!4889 0))(
  ( (ListLongMap!4890 (toList!2460 List!5821)) )
))
(declare-fun lt!172323 () ListLongMap!4889)

(declare-fun lt!172314 () tuple2!5976)

(declare-fun lt!172315 () ListLongMap!4889)

(declare-fun +!806 (ListLongMap!4889 tuple2!5976) ListLongMap!4889)

(assert (=> b!374172 (= (+!806 lt!172315 lt!172313) (+!806 lt!172323 lt!172314))))

(declare-fun v!373 () V!12975)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!12975)

(declare-datatypes ((Unit!11518 0))(
  ( (Unit!11519) )
))
(declare-fun lt!172312 () Unit!11518)

(declare-fun lt!172322 () ListLongMap!4889)

(declare-fun addCommutativeForDiffKeys!230 (ListLongMap!4889 (_ BitVec 64) V!12975 (_ BitVec 64) V!12975) Unit!11518)

(assert (=> b!374172 (= lt!172312 (addCommutativeForDiffKeys!230 lt!172322 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374173 () Bool)

(declare-fun res!210936 () Bool)

(declare-fun e!228060 () Bool)

(assert (=> b!374173 (=> (not res!210936) (not e!228060))))

(declare-datatypes ((array!21745 0))(
  ( (array!21746 (arr!10341 (Array (_ BitVec 32) (_ BitVec 64))) (size!10693 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21745)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21745 (_ BitVec 32)) Bool)

(assert (=> b!374173 (= res!210936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374174 () Bool)

(declare-fun res!210931 () Bool)

(assert (=> b!374174 (=> (not res!210931) (not e!228060))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374174 (= res!210931 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10693 _keys!658))))))

(declare-fun res!210939 () Bool)

(assert (=> start!37128 (=> (not res!210939) (not e!228060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37128 (= res!210939 (validMask!0 mask!970))))

(assert (=> start!37128 e!228060))

(declare-datatypes ((ValueCell!4108 0))(
  ( (ValueCellFull!4108 (v!6693 V!12975)) (EmptyCell!4108) )
))
(declare-datatypes ((array!21747 0))(
  ( (array!21748 (arr!10342 (Array (_ BitVec 32) ValueCell!4108)) (size!10694 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21747)

(declare-fun e!228057 () Bool)

(declare-fun array_inv!7626 (array!21747) Bool)

(assert (=> start!37128 (and (array_inv!7626 _values!506) e!228057)))

(assert (=> start!37128 tp!29481))

(assert (=> start!37128 true))

(declare-fun tp_is_empty!8903 () Bool)

(assert (=> start!37128 tp_is_empty!8903))

(declare-fun array_inv!7627 (array!21745) Bool)

(assert (=> start!37128 (array_inv!7627 _keys!658)))

(declare-fun b!374175 () Bool)

(declare-fun res!210934 () Bool)

(assert (=> b!374175 (=> (not res!210934) (not e!228060))))

(declare-datatypes ((List!5822 0))(
  ( (Nil!5819) (Cons!5818 (h!6674 (_ BitVec 64)) (t!10972 List!5822)) )
))
(declare-fun arrayNoDuplicates!0 (array!21745 (_ BitVec 32) List!5822) Bool)

(assert (=> b!374175 (= res!210934 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5819))))

(declare-fun b!374176 () Bool)

(declare-fun res!210941 () Bool)

(assert (=> b!374176 (=> (not res!210941) (not e!228060))))

(declare-fun arrayContainsKey!0 (array!21745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374176 (= res!210941 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!374177 () Bool)

(declare-fun res!210930 () Bool)

(assert (=> b!374177 (=> (not res!210930) (not e!228060))))

(assert (=> b!374177 (= res!210930 (or (= (select (arr!10341 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10341 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374178 () Bool)

(declare-fun res!210937 () Bool)

(declare-fun e!228059 () Bool)

(assert (=> b!374178 (=> (not res!210937) (not e!228059))))

(declare-fun lt!172320 () array!21745)

(assert (=> b!374178 (= res!210937 (arrayNoDuplicates!0 lt!172320 #b00000000000000000000000000000000 Nil!5819))))

(declare-fun mapIsEmpty!14919 () Bool)

(declare-fun mapRes!14919 () Bool)

(assert (=> mapIsEmpty!14919 mapRes!14919))

(declare-fun b!374179 () Bool)

(declare-fun e!228061 () Bool)

(assert (=> b!374179 (= e!228057 (and e!228061 mapRes!14919))))

(declare-fun condMapEmpty!14919 () Bool)

(declare-fun mapDefault!14919 () ValueCell!4108)

