; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36932 () Bool)

(assert start!36932)

(declare-fun b_free!8059 () Bool)

(declare-fun b_next!8059 () Bool)

(assert (=> start!36932 (= b_free!8059 (not b_next!8059))))

(declare-fun tp!28892 () Bool)

(declare-fun b_and!15301 () Bool)

(assert (=> start!36932 (= tp!28892 b_and!15301)))

(declare-fun mapNonEmpty!14625 () Bool)

(declare-fun mapRes!14625 () Bool)

(declare-fun tp!28893 () Bool)

(declare-fun e!226143 () Bool)

(assert (=> mapNonEmpty!14625 (= mapRes!14625 (and tp!28893 e!226143))))

(declare-datatypes ((V!12715 0))(
  ( (V!12716 (val!4398 Int)) )
))
(declare-datatypes ((ValueCell!4010 0))(
  ( (ValueCellFull!4010 (v!6595 V!12715)) (EmptyCell!4010) )
))
(declare-fun mapValue!14625 () ValueCell!4010)

(declare-datatypes ((array!21357 0))(
  ( (array!21358 (arr!10147 (Array (_ BitVec 32) ValueCell!4010)) (size!10499 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21357)

(declare-fun mapKey!14625 () (_ BitVec 32))

(declare-fun mapRest!14625 () (Array (_ BitVec 32) ValueCell!4010))

(assert (=> mapNonEmpty!14625 (= (arr!10147 _values!506) (store mapRest!14625 mapKey!14625 mapValue!14625))))

(declare-fun res!207830 () Bool)

(declare-fun e!226145 () Bool)

(assert (=> start!36932 (=> (not res!207830) (not e!226145))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36932 (= res!207830 (validMask!0 mask!970))))

(assert (=> start!36932 e!226145))

(declare-fun e!226142 () Bool)

(declare-fun array_inv!7496 (array!21357) Bool)

(assert (=> start!36932 (and (array_inv!7496 _values!506) e!226142)))

(assert (=> start!36932 tp!28892))

(assert (=> start!36932 true))

(declare-fun tp_is_empty!8707 () Bool)

(assert (=> start!36932 tp_is_empty!8707))

(declare-datatypes ((array!21359 0))(
  ( (array!21360 (arr!10148 (Array (_ BitVec 32) (_ BitVec 64))) (size!10500 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21359)

(declare-fun array_inv!7497 (array!21359) Bool)

(assert (=> start!36932 (array_inv!7497 _keys!658)))

(declare-fun b!370190 () Bool)

(declare-fun res!207834 () Bool)

(assert (=> b!370190 (=> (not res!207834) (not e!226145))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370190 (= res!207834 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!370191 () Bool)

(declare-fun e!226140 () Bool)

(assert (=> b!370191 (= e!226145 e!226140)))

(declare-fun res!207838 () Bool)

(assert (=> b!370191 (=> (not res!207838) (not e!226140))))

(declare-fun lt!169911 () array!21359)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21359 (_ BitVec 32)) Bool)

(assert (=> b!370191 (= res!207838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169911 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370191 (= lt!169911 (array!21360 (store (arr!10148 _keys!658) i!548 k!778) (size!10500 _keys!658)))))

(declare-fun b!370192 () Bool)

(declare-fun res!207835 () Bool)

(assert (=> b!370192 (=> (not res!207835) (not e!226145))))

(assert (=> b!370192 (= res!207835 (or (= (select (arr!10148 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10148 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370193 () Bool)

(declare-fun res!207831 () Bool)

(assert (=> b!370193 (=> (not res!207831) (not e!226145))))

(assert (=> b!370193 (= res!207831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370194 () Bool)

(declare-fun res!207837 () Bool)

(assert (=> b!370194 (=> (not res!207837) (not e!226140))))

(declare-datatypes ((List!5671 0))(
  ( (Nil!5668) (Cons!5667 (h!6523 (_ BitVec 64)) (t!10821 List!5671)) )
))
(declare-fun arrayNoDuplicates!0 (array!21359 (_ BitVec 32) List!5671) Bool)

(assert (=> b!370194 (= res!207837 (arrayNoDuplicates!0 lt!169911 #b00000000000000000000000000000000 Nil!5668))))

(declare-fun mapIsEmpty!14625 () Bool)

(assert (=> mapIsEmpty!14625 mapRes!14625))

(declare-fun b!370195 () Bool)

(assert (=> b!370195 (= e!226143 tp_is_empty!8707)))

(declare-fun b!370196 () Bool)

(declare-fun res!207832 () Bool)

(assert (=> b!370196 (=> (not res!207832) (not e!226145))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!370196 (= res!207832 (and (= (size!10499 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10500 _keys!658) (size!10499 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370197 () Bool)

(declare-fun res!207833 () Bool)

(assert (=> b!370197 (=> (not res!207833) (not e!226145))))

(assert (=> b!370197 (= res!207833 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5668))))

(declare-fun b!370198 () Bool)

(declare-fun e!226141 () Bool)

(assert (=> b!370198 (= e!226142 (and e!226141 mapRes!14625))))

(declare-fun condMapEmpty!14625 () Bool)

(declare-fun mapDefault!14625 () ValueCell!4010)

