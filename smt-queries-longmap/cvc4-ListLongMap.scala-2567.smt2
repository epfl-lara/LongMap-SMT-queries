; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39224 () Bool)

(assert start!39224)

(declare-fun b_free!9491 () Bool)

(declare-fun b_next!9491 () Bool)

(assert (=> start!39224 (= b_free!9491 (not b_next!9491))))

(declare-fun tp!34002 () Bool)

(declare-fun b_and!16877 () Bool)

(assert (=> start!39224 (= tp!34002 b_and!16877)))

(declare-fun res!240515 () Bool)

(declare-fun e!247399 () Bool)

(assert (=> start!39224 (=> (not res!240515) (not e!247399))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25143 0))(
  ( (array!25144 (arr!12021 (Array (_ BitVec 32) (_ BitVec 64))) (size!12373 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25143)

(assert (=> start!39224 (= res!240515 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12373 _keys!709))))))

(assert (=> start!39224 e!247399))

(declare-fun tp_is_empty!10643 () Bool)

(assert (=> start!39224 tp_is_empty!10643))

(assert (=> start!39224 tp!34002))

(assert (=> start!39224 true))

(declare-datatypes ((V!15295 0))(
  ( (V!15296 (val!5366 Int)) )
))
(declare-datatypes ((ValueCell!4978 0))(
  ( (ValueCellFull!4978 (v!7613 V!15295)) (EmptyCell!4978) )
))
(declare-datatypes ((array!25145 0))(
  ( (array!25146 (arr!12022 (Array (_ BitVec 32) ValueCell!4978)) (size!12374 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25145)

(declare-fun e!247404 () Bool)

(declare-fun array_inv!8768 (array!25145) Bool)

(assert (=> start!39224 (and (array_inv!8768 _values!549) e!247404)))

(declare-fun array_inv!8769 (array!25143) Bool)

(assert (=> start!39224 (array_inv!8769 _keys!709)))

(declare-fun b!413811 () Bool)

(declare-fun res!240517 () Bool)

(assert (=> b!413811 (=> (not res!240517) (not e!247399))))

(declare-datatypes ((List!6999 0))(
  ( (Nil!6996) (Cons!6995 (h!7851 (_ BitVec 64)) (t!12173 List!6999)) )
))
(declare-fun arrayNoDuplicates!0 (array!25143 (_ BitVec 32) List!6999) Bool)

(assert (=> b!413811 (= res!240517 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6996))))

(declare-fun b!413812 () Bool)

(declare-fun res!240522 () Bool)

(declare-fun e!247400 () Bool)

(assert (=> b!413812 (=> (not res!240522) (not e!247400))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413812 (= res!240522 (bvsle from!863 i!563))))

(declare-fun minValue!515 () V!15295)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15295)

(declare-fun c!54950 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!6976 0))(
  ( (tuple2!6977 (_1!3499 (_ BitVec 64)) (_2!3499 V!15295)) )
))
(declare-datatypes ((List!7000 0))(
  ( (Nil!6997) (Cons!6996 (h!7852 tuple2!6976) (t!12174 List!7000)) )
))
(declare-datatypes ((ListLongMap!5889 0))(
  ( (ListLongMap!5890 (toList!2960 List!7000)) )
))
(declare-fun call!28652 () ListLongMap!5889)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!189829 () array!25145)

(declare-fun lt!189830 () array!25143)

(declare-fun bm!28648 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1167 (array!25143 array!25145 (_ BitVec 32) (_ BitVec 32) V!15295 V!15295 (_ BitVec 32) Int) ListLongMap!5889)

(assert (=> bm!28648 (= call!28652 (getCurrentListMapNoExtraKeys!1167 (ite c!54950 _keys!709 lt!189830) (ite c!54950 _values!549 lt!189829) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17586 () Bool)

(declare-fun mapRes!17586 () Bool)

(assert (=> mapIsEmpty!17586 mapRes!17586))

(declare-fun b!413813 () Bool)

(declare-fun e!247401 () Bool)

(assert (=> b!413813 (= e!247404 (and e!247401 mapRes!17586))))

(declare-fun condMapEmpty!17586 () Bool)

(declare-fun mapDefault!17586 () ValueCell!4978)

