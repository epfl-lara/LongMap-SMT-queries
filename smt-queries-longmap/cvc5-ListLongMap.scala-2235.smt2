; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36872 () Bool)

(assert start!36872)

(declare-fun b_free!7999 () Bool)

(declare-fun b_next!7999 () Bool)

(assert (=> start!36872 (= b_free!7999 (not b_next!7999))))

(declare-fun tp!28713 () Bool)

(declare-fun b_and!15241 () Bool)

(assert (=> start!36872 (= tp!28713 b_and!15241)))

(declare-fun res!206936 () Bool)

(declare-fun e!225604 () Bool)

(assert (=> start!36872 (=> (not res!206936) (not e!225604))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36872 (= res!206936 (validMask!0 mask!970))))

(assert (=> start!36872 e!225604))

(declare-datatypes ((V!12635 0))(
  ( (V!12636 (val!4368 Int)) )
))
(declare-datatypes ((ValueCell!3980 0))(
  ( (ValueCellFull!3980 (v!6565 V!12635)) (EmptyCell!3980) )
))
(declare-datatypes ((array!21247 0))(
  ( (array!21248 (arr!10092 (Array (_ BitVec 32) ValueCell!3980)) (size!10444 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21247)

(declare-fun e!225602 () Bool)

(declare-fun array_inv!7458 (array!21247) Bool)

(assert (=> start!36872 (and (array_inv!7458 _values!506) e!225602)))

(assert (=> start!36872 tp!28713))

(assert (=> start!36872 true))

(declare-fun tp_is_empty!8647 () Bool)

(assert (=> start!36872 tp_is_empty!8647))

(declare-datatypes ((array!21249 0))(
  ( (array!21250 (arr!10093 (Array (_ BitVec 32) (_ BitVec 64))) (size!10445 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21249)

(declare-fun array_inv!7459 (array!21249) Bool)

(assert (=> start!36872 (array_inv!7459 _keys!658)))

(declare-fun mapNonEmpty!14535 () Bool)

(declare-fun mapRes!14535 () Bool)

(declare-fun tp!28712 () Bool)

(declare-fun e!225603 () Bool)

(assert (=> mapNonEmpty!14535 (= mapRes!14535 (and tp!28712 e!225603))))

(declare-fun mapValue!14535 () ValueCell!3980)

(declare-fun mapRest!14535 () (Array (_ BitVec 32) ValueCell!3980))

(declare-fun mapKey!14535 () (_ BitVec 32))

(assert (=> mapNonEmpty!14535 (= (arr!10092 _values!506) (store mapRest!14535 mapKey!14535 mapValue!14535))))

(declare-fun b!369020 () Bool)

(declare-fun res!206933 () Bool)

(assert (=> b!369020 (=> (not res!206933) (not e!225604))))

(declare-datatypes ((List!5625 0))(
  ( (Nil!5622) (Cons!5621 (h!6477 (_ BitVec 64)) (t!10775 List!5625)) )
))
(declare-fun arrayNoDuplicates!0 (array!21249 (_ BitVec 32) List!5625) Bool)

(assert (=> b!369020 (= res!206933 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5622))))

(declare-fun b!369021 () Bool)

(declare-fun res!206932 () Bool)

(declare-fun e!225600 () Bool)

(assert (=> b!369021 (=> (not res!206932) (not e!225600))))

(declare-fun lt!169640 () array!21249)

(assert (=> b!369021 (= res!206932 (arrayNoDuplicates!0 lt!169640 #b00000000000000000000000000000000 Nil!5622))))

(declare-fun mapIsEmpty!14535 () Bool)

(assert (=> mapIsEmpty!14535 mapRes!14535))

(declare-fun b!369022 () Bool)

(declare-fun res!206937 () Bool)

(assert (=> b!369022 (=> (not res!206937) (not e!225604))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369022 (= res!206937 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!369023 () Bool)

(declare-fun res!206930 () Bool)

(assert (=> b!369023 (=> (not res!206930) (not e!225604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21249 (_ BitVec 32)) Bool)

(assert (=> b!369023 (= res!206930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369024 () Bool)

(declare-fun res!206935 () Bool)

(assert (=> b!369024 (=> (not res!206935) (not e!225604))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369024 (= res!206935 (and (= (size!10444 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10445 _keys!658) (size!10444 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369025 () Bool)

(assert (=> b!369025 (= e!225603 tp_is_empty!8647)))

(declare-fun b!369026 () Bool)

(declare-fun e!225601 () Bool)

(assert (=> b!369026 (= e!225601 tp_is_empty!8647)))

(declare-fun b!369027 () Bool)

(declare-fun res!206939 () Bool)

(assert (=> b!369027 (=> (not res!206939) (not e!225604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369027 (= res!206939 (validKeyInArray!0 k!778))))

(declare-fun b!369028 () Bool)

(assert (=> b!369028 (= e!225602 (and e!225601 mapRes!14535))))

(declare-fun condMapEmpty!14535 () Bool)

(declare-fun mapDefault!14535 () ValueCell!3980)

