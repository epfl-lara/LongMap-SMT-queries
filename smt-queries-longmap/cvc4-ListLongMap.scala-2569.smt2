; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39236 () Bool)

(assert start!39236)

(declare-fun b_free!9503 () Bool)

(declare-fun b_next!9503 () Bool)

(assert (=> start!39236 (= b_free!9503 (not b_next!9503))))

(declare-fun tp!34038 () Bool)

(declare-fun b_and!16889 () Bool)

(assert (=> start!39236 (= tp!34038 b_and!16889)))

(declare-fun b!414135 () Bool)

(declare-fun res!240754 () Bool)

(declare-fun e!247545 () Bool)

(assert (=> b!414135 (=> (not res!240754) (not e!247545))))

(declare-datatypes ((array!25167 0))(
  ( (array!25168 (arr!12033 (Array (_ BitVec 32) (_ BitVec 64))) (size!12385 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25167)

(declare-datatypes ((List!7007 0))(
  ( (Nil!7004) (Cons!7003 (h!7859 (_ BitVec 64)) (t!12181 List!7007)) )
))
(declare-fun arrayNoDuplicates!0 (array!25167 (_ BitVec 32) List!7007) Bool)

(assert (=> b!414135 (= res!240754 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7004))))

(declare-fun b!414136 () Bool)

(declare-fun res!240755 () Bool)

(assert (=> b!414136 (=> (not res!240755) (not e!247545))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414136 (= res!240755 (validKeyInArray!0 k!794))))

(declare-fun b!414137 () Bool)

(declare-fun res!240759 () Bool)

(assert (=> b!414137 (=> (not res!240759) (not e!247545))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414137 (= res!240759 (or (= (select (arr!12033 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12033 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414138 () Bool)

(declare-fun res!240747 () Bool)

(assert (=> b!414138 (=> (not res!240747) (not e!247545))))

(assert (=> b!414138 (= res!240747 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12385 _keys!709))))))

(declare-fun mapIsEmpty!17604 () Bool)

(declare-fun mapRes!17604 () Bool)

(assert (=> mapIsEmpty!17604 mapRes!17604))

(declare-fun b!414139 () Bool)

(declare-fun e!247547 () Bool)

(assert (=> b!414139 (= e!247545 e!247547)))

(declare-fun res!240752 () Bool)

(assert (=> b!414139 (=> (not res!240752) (not e!247547))))

(declare-fun lt!189920 () array!25167)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25167 (_ BitVec 32)) Bool)

(assert (=> b!414139 (= res!240752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189920 mask!1025))))

(assert (=> b!414139 (= lt!189920 (array!25168 (store (arr!12033 _keys!709) i!563 k!794) (size!12385 _keys!709)))))

(declare-fun e!247546 () Bool)

(declare-datatypes ((V!15311 0))(
  ( (V!15312 (val!5372 Int)) )
))
(declare-datatypes ((tuple2!6984 0))(
  ( (tuple2!6985 (_1!3503 (_ BitVec 64)) (_2!3503 V!15311)) )
))
(declare-datatypes ((List!7008 0))(
  ( (Nil!7005) (Cons!7004 (h!7860 tuple2!6984) (t!12182 List!7008)) )
))
(declare-datatypes ((ListLongMap!5897 0))(
  ( (ListLongMap!5898 (toList!2964 List!7008)) )
))
(declare-fun call!28688 () ListLongMap!5897)

(declare-fun b!414140 () Bool)

(declare-fun call!28687 () ListLongMap!5897)

(declare-fun v!412 () V!15311)

(declare-fun +!1171 (ListLongMap!5897 tuple2!6984) ListLongMap!5897)

(assert (=> b!414140 (= e!247546 (= call!28687 (+!1171 call!28688 (tuple2!6985 k!794 v!412))))))

(declare-fun b!414141 () Bool)

(declare-fun res!240756 () Bool)

(assert (=> b!414141 (=> (not res!240756) (not e!247545))))

(declare-fun arrayContainsKey!0 (array!25167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414141 (= res!240756 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!414142 () Bool)

(declare-fun res!240758 () Bool)

(assert (=> b!414142 (=> (not res!240758) (not e!247547))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!414142 (= res!240758 (bvsle from!863 i!563))))

(declare-fun b!414143 () Bool)

(declare-fun e!247543 () Bool)

(declare-fun e!247541 () Bool)

(assert (=> b!414143 (= e!247543 (and e!247541 mapRes!17604))))

(declare-fun condMapEmpty!17604 () Bool)

(declare-datatypes ((ValueCell!4984 0))(
  ( (ValueCellFull!4984 (v!7619 V!15311)) (EmptyCell!4984) )
))
(declare-datatypes ((array!25169 0))(
  ( (array!25170 (arr!12034 (Array (_ BitVec 32) ValueCell!4984)) (size!12386 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25169)

(declare-fun mapDefault!17604 () ValueCell!4984)

