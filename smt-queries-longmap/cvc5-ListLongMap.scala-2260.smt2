; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37022 () Bool)

(assert start!37022)

(declare-fun b_free!8149 () Bool)

(declare-fun b_next!8149 () Bool)

(assert (=> start!37022 (= b_free!8149 (not b_next!8149))))

(declare-fun tp!29163 () Bool)

(declare-fun b_and!15391 () Bool)

(assert (=> start!37022 (= tp!29163 b_and!15391)))

(declare-fun b!371945 () Bool)

(declare-fun res!209186 () Bool)

(declare-fun e!226950 () Bool)

(assert (=> b!371945 (=> (not res!209186) (not e!226950))))

(declare-datatypes ((array!21535 0))(
  ( (array!21536 (arr!10236 (Array (_ BitVec 32) (_ BitVec 64))) (size!10588 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21535)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21535 (_ BitVec 32)) Bool)

(assert (=> b!371945 (= res!209186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371946 () Bool)

(declare-fun e!226951 () Bool)

(assert (=> b!371946 (= e!226950 e!226951)))

(declare-fun res!209184 () Bool)

(assert (=> b!371946 (=> (not res!209184) (not e!226951))))

(declare-fun lt!170484 () array!21535)

(assert (=> b!371946 (= res!209184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170484 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371946 (= lt!170484 (array!21536 (store (arr!10236 _keys!658) i!548 k!778) (size!10588 _keys!658)))))

(declare-fun b!371947 () Bool)

(declare-fun res!209182 () Bool)

(assert (=> b!371947 (=> (not res!209182) (not e!226950))))

(declare-datatypes ((List!5737 0))(
  ( (Nil!5734) (Cons!5733 (h!6589 (_ BitVec 64)) (t!10887 List!5737)) )
))
(declare-fun arrayNoDuplicates!0 (array!21535 (_ BitVec 32) List!5737) Bool)

(assert (=> b!371947 (= res!209182 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5734))))

(declare-fun b!371948 () Bool)

(declare-fun res!209189 () Bool)

(assert (=> b!371948 (=> (not res!209189) (not e!226950))))

(declare-fun arrayContainsKey!0 (array!21535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371948 (= res!209189 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!371949 () Bool)

(declare-fun res!209185 () Bool)

(assert (=> b!371949 (=> (not res!209185) (not e!226950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371949 (= res!209185 (validKeyInArray!0 k!778))))

(declare-fun b!371950 () Bool)

(declare-fun res!209180 () Bool)

(assert (=> b!371950 (=> (not res!209180) (not e!226950))))

(assert (=> b!371950 (= res!209180 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10588 _keys!658))))))

(declare-fun b!371951 () Bool)

(declare-fun res!209183 () Bool)

(assert (=> b!371951 (=> (not res!209183) (not e!226951))))

(assert (=> b!371951 (= res!209183 (arrayNoDuplicates!0 lt!170484 #b00000000000000000000000000000000 Nil!5734))))

(declare-fun res!209188 () Bool)

(assert (=> start!37022 (=> (not res!209188) (not e!226950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37022 (= res!209188 (validMask!0 mask!970))))

(assert (=> start!37022 e!226950))

(declare-datatypes ((V!12835 0))(
  ( (V!12836 (val!4443 Int)) )
))
(declare-datatypes ((ValueCell!4055 0))(
  ( (ValueCellFull!4055 (v!6640 V!12835)) (EmptyCell!4055) )
))
(declare-datatypes ((array!21537 0))(
  ( (array!21538 (arr!10237 (Array (_ BitVec 32) ValueCell!4055)) (size!10589 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21537)

(declare-fun e!226955 () Bool)

(declare-fun array_inv!7554 (array!21537) Bool)

(assert (=> start!37022 (and (array_inv!7554 _values!506) e!226955)))

(assert (=> start!37022 tp!29163))

(assert (=> start!37022 true))

(declare-fun tp_is_empty!8797 () Bool)

(assert (=> start!37022 tp_is_empty!8797))

(declare-fun array_inv!7555 (array!21535) Bool)

(assert (=> start!37022 (array_inv!7555 _keys!658)))

(declare-fun b!371952 () Bool)

(declare-fun res!209187 () Bool)

(assert (=> b!371952 (=> (not res!209187) (not e!226950))))

(assert (=> b!371952 (= res!209187 (or (= (select (arr!10236 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10236 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371953 () Bool)

(declare-fun e!226954 () Bool)

(declare-fun mapRes!14760 () Bool)

(assert (=> b!371953 (= e!226955 (and e!226954 mapRes!14760))))

(declare-fun condMapEmpty!14760 () Bool)

(declare-fun mapDefault!14760 () ValueCell!4055)

