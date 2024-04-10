; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39200 () Bool)

(assert start!39200)

(declare-fun b_free!9467 () Bool)

(declare-fun b_next!9467 () Bool)

(assert (=> start!39200 (= b_free!9467 (not b_next!9467))))

(declare-fun tp!33930 () Bool)

(declare-fun b_and!16853 () Bool)

(assert (=> start!39200 (= tp!33930 b_and!16853)))

(declare-fun res!240054 () Bool)

(declare-fun e!247113 () Bool)

(assert (=> start!39200 (=> (not res!240054) (not e!247113))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25095 0))(
  ( (array!25096 (arr!11997 (Array (_ BitVec 32) (_ BitVec 64))) (size!12349 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25095)

(assert (=> start!39200 (= res!240054 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12349 _keys!709))))))

(assert (=> start!39200 e!247113))

(declare-fun tp_is_empty!10619 () Bool)

(assert (=> start!39200 tp_is_empty!10619))

(assert (=> start!39200 tp!33930))

(assert (=> start!39200 true))

(declare-datatypes ((V!15263 0))(
  ( (V!15264 (val!5354 Int)) )
))
(declare-datatypes ((ValueCell!4966 0))(
  ( (ValueCellFull!4966 (v!7601 V!15263)) (EmptyCell!4966) )
))
(declare-datatypes ((array!25097 0))(
  ( (array!25098 (arr!11998 (Array (_ BitVec 32) ValueCell!4966)) (size!12350 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25097)

(declare-fun e!247115 () Bool)

(declare-fun array_inv!8750 (array!25097) Bool)

(assert (=> start!39200 (and (array_inv!8750 _values!549) e!247115)))

(declare-fun array_inv!8751 (array!25095) Bool)

(assert (=> start!39200 (array_inv!8751 _keys!709)))

(declare-fun minValue!515 () V!15263)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!189649 () array!25095)

(declare-fun bm!28576 () Bool)

(declare-fun zeroValue!515 () V!15263)

(declare-fun lt!189650 () array!25097)

(declare-fun c!54914 () Bool)

(declare-datatypes ((tuple2!6952 0))(
  ( (tuple2!6953 (_1!3487 (_ BitVec 64)) (_2!3487 V!15263)) )
))
(declare-datatypes ((List!6977 0))(
  ( (Nil!6974) (Cons!6973 (h!7829 tuple2!6952) (t!12151 List!6977)) )
))
(declare-datatypes ((ListLongMap!5865 0))(
  ( (ListLongMap!5866 (toList!2948 List!6977)) )
))
(declare-fun call!28580 () ListLongMap!5865)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1156 (array!25095 array!25097 (_ BitVec 32) (_ BitVec 32) V!15263 V!15263 (_ BitVec 32) Int) ListLongMap!5865)

(assert (=> bm!28576 (= call!28580 (getCurrentListMapNoExtraKeys!1156 (ite c!54914 _keys!709 lt!189649) (ite c!54914 _values!549 lt!189650) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413163 () Bool)

(declare-fun e!247110 () Bool)

(declare-fun call!28579 () ListLongMap!5865)

(assert (=> b!413163 (= e!247110 (= call!28580 call!28579))))

(declare-fun b!413164 () Bool)

(declare-fun e!247111 () Bool)

(assert (=> b!413164 (= e!247111 tp_is_empty!10619)))

(declare-fun b!413165 () Bool)

(declare-fun res!240048 () Bool)

(assert (=> b!413165 (=> (not res!240048) (not e!247113))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413165 (= res!240048 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!413166 () Bool)

(declare-fun e!247112 () Bool)

(assert (=> b!413166 (= e!247112 tp_is_empty!10619)))

(declare-fun b!413167 () Bool)

(declare-fun res!240052 () Bool)

(assert (=> b!413167 (=> (not res!240052) (not e!247113))))

(declare-datatypes ((List!6978 0))(
  ( (Nil!6975) (Cons!6974 (h!7830 (_ BitVec 64)) (t!12152 List!6978)) )
))
(declare-fun arrayNoDuplicates!0 (array!25095 (_ BitVec 32) List!6978) Bool)

(assert (=> b!413167 (= res!240052 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6975))))

(declare-fun b!413168 () Bool)

(declare-fun res!240057 () Bool)

(assert (=> b!413168 (=> (not res!240057) (not e!247113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413168 (= res!240057 (validMask!0 mask!1025))))

(declare-fun b!413169 () Bool)

(declare-fun e!247116 () Bool)

(assert (=> b!413169 (= e!247116 (not true))))

(assert (=> b!413169 e!247110))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413169 (= c!54914 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12226 0))(
  ( (Unit!12227) )
))
(declare-fun lt!189651 () Unit!12226)

(declare-fun v!412 () V!15263)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!371 (array!25095 array!25097 (_ BitVec 32) (_ BitVec 32) V!15263 V!15263 (_ BitVec 32) (_ BitVec 64) V!15263 (_ BitVec 32) Int) Unit!12226)

(assert (=> b!413169 (= lt!189651 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!371 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413170 () Bool)

(declare-fun res!240055 () Bool)

(assert (=> b!413170 (=> (not res!240055) (not e!247113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25095 (_ BitVec 32)) Bool)

(assert (=> b!413170 (= res!240055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413171 () Bool)

(declare-fun res!240056 () Bool)

(assert (=> b!413171 (=> (not res!240056) (not e!247113))))

(assert (=> b!413171 (= res!240056 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12349 _keys!709))))))

(declare-fun b!413172 () Bool)

(declare-fun mapRes!17550 () Bool)

(assert (=> b!413172 (= e!247115 (and e!247112 mapRes!17550))))

(declare-fun condMapEmpty!17550 () Bool)

(declare-fun mapDefault!17550 () ValueCell!4966)

