; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36672 () Bool)

(assert start!36672)

(declare-fun res!204660 () Bool)

(declare-fun e!224144 () Bool)

(assert (=> start!36672 (=> (not res!204660) (not e!224144))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36672 (= res!204660 (validMask!0 mask!970))))

(assert (=> start!36672 e!224144))

(assert (=> start!36672 true))

(declare-datatypes ((V!12431 0))(
  ( (V!12432 (val!4292 Int)) )
))
(declare-datatypes ((ValueCell!3904 0))(
  ( (ValueCellFull!3904 (v!6488 V!12431)) (EmptyCell!3904) )
))
(declare-datatypes ((array!20943 0))(
  ( (array!20944 (arr!9943 (Array (_ BitVec 32) ValueCell!3904)) (size!10295 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20943)

(declare-fun e!224141 () Bool)

(declare-fun array_inv!7356 (array!20943) Bool)

(assert (=> start!36672 (and (array_inv!7356 _values!506) e!224141)))

(declare-datatypes ((array!20945 0))(
  ( (array!20946 (arr!9944 (Array (_ BitVec 32) (_ BitVec 64))) (size!10296 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20945)

(declare-fun array_inv!7357 (array!20945) Bool)

(assert (=> start!36672 (array_inv!7357 _keys!658)))

(declare-fun mapNonEmpty!14298 () Bool)

(declare-fun mapRes!14298 () Bool)

(declare-fun tp!28374 () Bool)

(declare-fun e!224142 () Bool)

(assert (=> mapNonEmpty!14298 (= mapRes!14298 (and tp!28374 e!224142))))

(declare-fun mapValue!14298 () ValueCell!3904)

(declare-fun mapRest!14298 () (Array (_ BitVec 32) ValueCell!3904))

(declare-fun mapKey!14298 () (_ BitVec 32))

(assert (=> mapNonEmpty!14298 (= (arr!9943 _values!506) (store mapRest!14298 mapKey!14298 mapValue!14298))))

(declare-fun b!365998 () Bool)

(declare-fun res!204658 () Bool)

(assert (=> b!365998 (=> (not res!204658) (not e!224144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20945 (_ BitVec 32)) Bool)

(assert (=> b!365998 (= res!204658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365999 () Bool)

(declare-fun tp_is_empty!8495 () Bool)

(assert (=> b!365999 (= e!224142 tp_is_empty!8495)))

(declare-fun b!366000 () Bool)

(declare-fun e!224143 () Bool)

(assert (=> b!366000 (= e!224141 (and e!224143 mapRes!14298))))

(declare-fun condMapEmpty!14298 () Bool)

(declare-fun mapDefault!14298 () ValueCell!3904)

