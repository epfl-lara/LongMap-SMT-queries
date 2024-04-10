; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38672 () Bool)

(assert start!38672)

(declare-fun b_free!9209 () Bool)

(declare-fun b_next!9209 () Bool)

(assert (=> start!38672 (= b_free!9209 (not b_next!9209))))

(declare-fun tp!32750 () Bool)

(declare-fun b_and!16595 () Bool)

(assert (=> start!38672 (= tp!32750 b_and!16595)))

(declare-fun res!231345 () Bool)

(declare-fun e!242197 () Bool)

(assert (=> start!38672 (=> (not res!231345) (not e!242197))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24089 0))(
  ( (array!24090 (arr!11494 (Array (_ BitVec 32) (_ BitVec 64))) (size!11846 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24089)

(assert (=> start!38672 (= res!231345 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11846 _keys!709))))))

(assert (=> start!38672 e!242197))

(declare-fun tp_is_empty!10091 () Bool)

(assert (=> start!38672 tp_is_empty!10091))

(assert (=> start!38672 tp!32750))

(assert (=> start!38672 true))

(declare-datatypes ((V!14559 0))(
  ( (V!14560 (val!5090 Int)) )
))
(declare-datatypes ((ValueCell!4702 0))(
  ( (ValueCellFull!4702 (v!7337 V!14559)) (EmptyCell!4702) )
))
(declare-datatypes ((array!24091 0))(
  ( (array!24092 (arr!11495 (Array (_ BitVec 32) ValueCell!4702)) (size!11847 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24091)

(declare-fun e!242200 () Bool)

(declare-fun array_inv!8416 (array!24091) Bool)

(assert (=> start!38672 (and (array_inv!8416 _values!549) e!242200)))

(declare-fun array_inv!8417 (array!24089) Bool)

(assert (=> start!38672 (array_inv!8417 _keys!709)))

(declare-fun b!401788 () Bool)

(declare-fun res!231337 () Bool)

(assert (=> b!401788 (=> (not res!231337) (not e!242197))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401788 (= res!231337 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!401789 () Bool)

(declare-fun e!242201 () Bool)

(assert (=> b!401789 (= e!242201 tp_is_empty!10091)))

(declare-fun b!401790 () Bool)

(declare-fun res!231343 () Bool)

(assert (=> b!401790 (=> (not res!231343) (not e!242197))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401790 (= res!231343 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11846 _keys!709))))))

(declare-fun b!401791 () Bool)

(declare-fun e!242196 () Bool)

(assert (=> b!401791 (= e!242196 (not true))))

(declare-fun e!242198 () Bool)

(assert (=> b!401791 e!242198))

(declare-fun c!54770 () Bool)

(assert (=> b!401791 (= c!54770 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14559)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun v!412 () V!14559)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14559)

(declare-datatypes ((Unit!12170 0))(
  ( (Unit!12171) )
))
(declare-fun lt!187852 () Unit!12170)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!343 (array!24089 array!24091 (_ BitVec 32) (_ BitVec 32) V!14559 V!14559 (_ BitVec 32) (_ BitVec 64) V!14559 (_ BitVec 32) Int) Unit!12170)

(assert (=> b!401791 (= lt!187852 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!343 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401792 () Bool)

(declare-fun e!242199 () Bool)

(assert (=> b!401792 (= e!242199 tp_is_empty!10091)))

(declare-fun b!401793 () Bool)

(declare-fun res!231334 () Bool)

(assert (=> b!401793 (=> (not res!231334) (not e!242196))))

(declare-fun lt!187853 () array!24089)

(declare-datatypes ((List!6681 0))(
  ( (Nil!6678) (Cons!6677 (h!7533 (_ BitVec 64)) (t!11855 List!6681)) )
))
(declare-fun arrayNoDuplicates!0 (array!24089 (_ BitVec 32) List!6681) Bool)

(assert (=> b!401793 (= res!231334 (arrayNoDuplicates!0 lt!187853 #b00000000000000000000000000000000 Nil!6678))))

(declare-fun b!401794 () Bool)

(assert (=> b!401794 (= e!242197 e!242196)))

(declare-fun res!231339 () Bool)

(assert (=> b!401794 (=> (not res!231339) (not e!242196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24089 (_ BitVec 32)) Bool)

(assert (=> b!401794 (= res!231339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187853 mask!1025))))

(assert (=> b!401794 (= lt!187853 (array!24090 (store (arr!11494 _keys!709) i!563 k!794) (size!11846 _keys!709)))))

(declare-fun bm!28288 () Bool)

(declare-datatypes ((tuple2!6758 0))(
  ( (tuple2!6759 (_1!3390 (_ BitVec 64)) (_2!3390 V!14559)) )
))
(declare-datatypes ((List!6682 0))(
  ( (Nil!6679) (Cons!6678 (h!7534 tuple2!6758) (t!11856 List!6682)) )
))
(declare-datatypes ((ListLongMap!5671 0))(
  ( (ListLongMap!5672 (toList!2851 List!6682)) )
))
(declare-fun call!28291 () ListLongMap!5671)

(declare-fun getCurrentListMapNoExtraKeys!1063 (array!24089 array!24091 (_ BitVec 32) (_ BitVec 32) V!14559 V!14559 (_ BitVec 32) Int) ListLongMap!5671)

(assert (=> bm!28288 (= call!28291 (getCurrentListMapNoExtraKeys!1063 (ite c!54770 _keys!709 lt!187853) (ite c!54770 _values!549 (array!24092 (store (arr!11495 _values!549) i!563 (ValueCellFull!4702 v!412)) (size!11847 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401795 () Bool)

(declare-fun res!231335 () Bool)

(assert (=> b!401795 (=> (not res!231335) (not e!242197))))

(assert (=> b!401795 (= res!231335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401796 () Bool)

(declare-fun res!231338 () Bool)

(assert (=> b!401796 (=> (not res!231338) (not e!242197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401796 (= res!231338 (validKeyInArray!0 k!794))))

(declare-fun b!401797 () Bool)

(declare-fun mapRes!16758 () Bool)

(assert (=> b!401797 (= e!242200 (and e!242199 mapRes!16758))))

(declare-fun condMapEmpty!16758 () Bool)

(declare-fun mapDefault!16758 () ValueCell!4702)

