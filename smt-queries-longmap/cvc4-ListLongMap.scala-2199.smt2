; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36556 () Bool)

(assert start!36556)

(declare-fun b!365182 () Bool)

(declare-fun e!223569 () Bool)

(declare-fun tp_is_empty!8435 () Bool)

(assert (=> b!365182 (= e!223569 tp_is_empty!8435)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12351 0))(
  ( (V!12352 (val!4262 Int)) )
))
(declare-datatypes ((ValueCell!3874 0))(
  ( (ValueCellFull!3874 (v!6457 V!12351)) (EmptyCell!3874) )
))
(declare-datatypes ((array!20825 0))(
  ( (array!20826 (arr!9890 (Array (_ BitVec 32) ValueCell!3874)) (size!10242 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20825)

(declare-fun e!223570 () Bool)

(declare-fun b!365183 () Bool)

(declare-datatypes ((array!20827 0))(
  ( (array!20828 (arr!9891 (Array (_ BitVec 32) (_ BitVec 64))) (size!10243 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20827)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365183 (= e!223570 (and (= (size!10242 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10243 _keys!658) (size!10242 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011) (= (size!10243 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970)) (bvsgt #b00000000000000000000000000000000 (size!10243 _keys!658))))))

(declare-fun mapNonEmpty!14190 () Bool)

(declare-fun mapRes!14190 () Bool)

(declare-fun tp!28266 () Bool)

(assert (=> mapNonEmpty!14190 (= mapRes!14190 (and tp!28266 e!223569))))

(declare-fun mapKey!14190 () (_ BitVec 32))

(declare-fun mapValue!14190 () ValueCell!3874)

(declare-fun mapRest!14190 () (Array (_ BitVec 32) ValueCell!3874))

(assert (=> mapNonEmpty!14190 (= (arr!9890 _values!506) (store mapRest!14190 mapKey!14190 mapValue!14190))))

(declare-fun b!365184 () Bool)

(declare-fun e!223571 () Bool)

(declare-fun e!223573 () Bool)

(assert (=> b!365184 (= e!223571 (and e!223573 mapRes!14190))))

(declare-fun condMapEmpty!14190 () Bool)

(declare-fun mapDefault!14190 () ValueCell!3874)

