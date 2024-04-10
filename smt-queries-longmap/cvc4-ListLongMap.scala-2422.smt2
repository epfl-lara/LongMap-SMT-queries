; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38264 () Bool)

(assert start!38264)

(declare-fun b!394805 () Bool)

(declare-fun res!226306 () Bool)

(declare-fun e!239021 () Bool)

(assert (=> b!394805 (=> (not res!226306) (not e!239021))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394805 (= res!226306 (validMask!0 mask!1025))))

(declare-fun b!394806 () Bool)

(declare-fun res!226305 () Bool)

(assert (=> b!394806 (=> (not res!226305) (not e!239021))))

(declare-datatypes ((array!23451 0))(
  ( (array!23452 (arr!11182 (Array (_ BitVec 32) (_ BitVec 64))) (size!11534 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23451)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23451 (_ BitVec 32)) Bool)

(assert (=> b!394806 (= res!226305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!394807 () Bool)

(declare-fun res!226307 () Bool)

(assert (=> b!394807 (=> (not res!226307) (not e!239021))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14135 0))(
  ( (V!14136 (val!4931 Int)) )
))
(declare-datatypes ((ValueCell!4543 0))(
  ( (ValueCellFull!4543 (v!7176 V!14135)) (EmptyCell!4543) )
))
(declare-datatypes ((array!23453 0))(
  ( (array!23454 (arr!11183 (Array (_ BitVec 32) ValueCell!4543)) (size!11535 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23453)

(assert (=> b!394807 (= res!226307 (and (= (size!11535 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11534 _keys!709) (size!11535 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394809 () Bool)

(declare-fun e!239018 () Bool)

(declare-fun tp_is_empty!9773 () Bool)

(assert (=> b!394809 (= e!239018 tp_is_empty!9773)))

(declare-fun b!394810 () Bool)

(assert (=> b!394810 (= e!239021 (and (bvsle #b00000000000000000000000000000000 (size!11534 _keys!709)) (bvsge (size!11534 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!16260 () Bool)

(declare-fun mapRes!16260 () Bool)

(assert (=> mapIsEmpty!16260 mapRes!16260))

(declare-fun mapNonEmpty!16260 () Bool)

(declare-fun tp!32055 () Bool)

(declare-fun e!239020 () Bool)

(assert (=> mapNonEmpty!16260 (= mapRes!16260 (and tp!32055 e!239020))))

(declare-fun mapValue!16260 () ValueCell!4543)

(declare-fun mapKey!16260 () (_ BitVec 32))

(declare-fun mapRest!16260 () (Array (_ BitVec 32) ValueCell!4543))

(assert (=> mapNonEmpty!16260 (= (arr!11183 _values!549) (store mapRest!16260 mapKey!16260 mapValue!16260))))

(declare-fun b!394811 () Bool)

(assert (=> b!394811 (= e!239020 tp_is_empty!9773)))

(declare-fun b!394808 () Bool)

(declare-fun e!239017 () Bool)

(assert (=> b!394808 (= e!239017 (and e!239018 mapRes!16260))))

(declare-fun condMapEmpty!16260 () Bool)

(declare-fun mapDefault!16260 () ValueCell!4543)

