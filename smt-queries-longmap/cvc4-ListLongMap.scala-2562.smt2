; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39194 () Bool)

(assert start!39194)

(declare-fun b_free!9461 () Bool)

(declare-fun b_next!9461 () Bool)

(assert (=> start!39194 (= b_free!9461 (not b_next!9461))))

(declare-fun tp!33912 () Bool)

(declare-fun b_and!16847 () Bool)

(assert (=> start!39194 (= tp!33912 b_and!16847)))

(declare-fun b!413001 () Bool)

(declare-fun e!247044 () Bool)

(assert (=> b!413001 (= e!247044 (not true))))

(declare-fun e!247042 () Bool)

(assert (=> b!413001 e!247042))

(declare-fun c!54905 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413001 (= c!54905 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15255 0))(
  ( (V!15256 (val!5351 Int)) )
))
(declare-fun minValue!515 () V!15255)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4963 0))(
  ( (ValueCellFull!4963 (v!7598 V!15255)) (EmptyCell!4963) )
))
(declare-datatypes ((array!25085 0))(
  ( (array!25086 (arr!11992 (Array (_ BitVec 32) ValueCell!4963)) (size!12344 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25085)

(declare-fun zeroValue!515 () V!15255)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12222 0))(
  ( (Unit!12223) )
))
(declare-fun lt!189607 () Unit!12222)

(declare-fun v!412 () V!15255)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25087 0))(
  ( (array!25088 (arr!11993 (Array (_ BitVec 32) (_ BitVec 64))) (size!12345 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25087)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!369 (array!25087 array!25085 (_ BitVec 32) (_ BitVec 32) V!15255 V!15255 (_ BitVec 32) (_ BitVec 64) V!15255 (_ BitVec 32) Int) Unit!12222)

(assert (=> b!413001 (= lt!189607 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!369 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17541 () Bool)

(declare-fun mapRes!17541 () Bool)

(declare-fun tp!33911 () Bool)

(declare-fun e!247039 () Bool)

(assert (=> mapNonEmpty!17541 (= mapRes!17541 (and tp!33911 e!247039))))

(declare-fun mapRest!17541 () (Array (_ BitVec 32) ValueCell!4963))

(declare-fun mapKey!17541 () (_ BitVec 32))

(declare-fun mapValue!17541 () ValueCell!4963)

(assert (=> mapNonEmpty!17541 (= (arr!11992 _values!549) (store mapRest!17541 mapKey!17541 mapValue!17541))))

(declare-datatypes ((tuple2!6948 0))(
  ( (tuple2!6949 (_1!3485 (_ BitVec 64)) (_2!3485 V!15255)) )
))
(declare-datatypes ((List!6973 0))(
  ( (Nil!6970) (Cons!6969 (h!7825 tuple2!6948) (t!12147 List!6973)) )
))
(declare-datatypes ((ListLongMap!5861 0))(
  ( (ListLongMap!5862 (toList!2946 List!6973)) )
))
(declare-fun call!28562 () ListLongMap!5861)

(declare-fun b!413002 () Bool)

(declare-fun call!28561 () ListLongMap!5861)

(declare-fun +!1159 (ListLongMap!5861 tuple2!6948) ListLongMap!5861)

(assert (=> b!413002 (= e!247042 (= call!28562 (+!1159 call!28561 (tuple2!6949 k!794 v!412))))))

(declare-fun b!413003 () Bool)

(declare-fun res!239929 () Bool)

(declare-fun e!247037 () Bool)

(assert (=> b!413003 (=> (not res!239929) (not e!247037))))

(assert (=> b!413003 (= res!239929 (bvsle from!863 i!563))))

(declare-fun b!413004 () Bool)

(declare-fun res!239935 () Bool)

(declare-fun e!247043 () Bool)

(assert (=> b!413004 (=> (not res!239935) (not e!247043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413004 (= res!239935 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17541 () Bool)

(assert (=> mapIsEmpty!17541 mapRes!17541))

(declare-fun b!413005 () Bool)

(assert (=> b!413005 (= e!247042 (= call!28561 call!28562))))

(declare-fun b!413006 () Bool)

(declare-fun res!239939 () Bool)

(assert (=> b!413006 (=> (not res!239939) (not e!247043))))

(assert (=> b!413006 (= res!239939 (or (= (select (arr!11993 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11993 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413007 () Bool)

(declare-fun e!247041 () Bool)

(declare-fun tp_is_empty!10613 () Bool)

(assert (=> b!413007 (= e!247041 tp_is_empty!10613)))

(declare-fun b!413008 () Bool)

(declare-fun res!239928 () Bool)

(assert (=> b!413008 (=> (not res!239928) (not e!247043))))

(assert (=> b!413008 (= res!239928 (and (= (size!12344 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12345 _keys!709) (size!12344 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413009 () Bool)

(declare-fun res!239937 () Bool)

(assert (=> b!413009 (=> (not res!239937) (not e!247043))))

(declare-datatypes ((List!6974 0))(
  ( (Nil!6971) (Cons!6970 (h!7826 (_ BitVec 64)) (t!12148 List!6974)) )
))
(declare-fun arrayNoDuplicates!0 (array!25087 (_ BitVec 32) List!6974) Bool)

(assert (=> b!413009 (= res!239937 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6971))))

(declare-fun b!413010 () Bool)

(declare-fun res!239932 () Bool)

(assert (=> b!413010 (=> (not res!239932) (not e!247043))))

(assert (=> b!413010 (= res!239932 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12345 _keys!709))))))

(declare-fun b!413011 () Bool)

(declare-fun res!239938 () Bool)

(assert (=> b!413011 (=> (not res!239938) (not e!247043))))

(declare-fun arrayContainsKey!0 (array!25087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413011 (= res!239938 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!413012 () Bool)

(assert (=> b!413012 (= e!247039 tp_is_empty!10613)))

(declare-fun lt!189606 () array!25087)

(declare-fun lt!189605 () array!25085)

(declare-fun bm!28559 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1154 (array!25087 array!25085 (_ BitVec 32) (_ BitVec 32) V!15255 V!15255 (_ BitVec 32) Int) ListLongMap!5861)

(assert (=> bm!28559 (= call!28561 (getCurrentListMapNoExtraKeys!1154 (ite c!54905 _keys!709 lt!189606) (ite c!54905 _values!549 lt!189605) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413013 () Bool)

(assert (=> b!413013 (= e!247043 e!247037)))

(declare-fun res!239934 () Bool)

(assert (=> b!413013 (=> (not res!239934) (not e!247037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25087 (_ BitVec 32)) Bool)

(assert (=> b!413013 (= res!239934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189606 mask!1025))))

(assert (=> b!413013 (= lt!189606 (array!25088 (store (arr!11993 _keys!709) i!563 k!794) (size!12345 _keys!709)))))

(declare-fun b!413014 () Bool)

(declare-fun res!239933 () Bool)

(assert (=> b!413014 (=> (not res!239933) (not e!247043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413014 (= res!239933 (validKeyInArray!0 k!794))))

(declare-fun b!413015 () Bool)

(declare-fun res!239931 () Bool)

(assert (=> b!413015 (=> (not res!239931) (not e!247043))))

(assert (=> b!413015 (= res!239931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28558 () Bool)

(assert (=> bm!28558 (= call!28562 (getCurrentListMapNoExtraKeys!1154 (ite c!54905 lt!189606 _keys!709) (ite c!54905 lt!189605 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!239930 () Bool)

(assert (=> start!39194 (=> (not res!239930) (not e!247043))))

(assert (=> start!39194 (= res!239930 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12345 _keys!709))))))

(assert (=> start!39194 e!247043))

(assert (=> start!39194 tp_is_empty!10613))

(assert (=> start!39194 tp!33912))

(assert (=> start!39194 true))

(declare-fun e!247038 () Bool)

(declare-fun array_inv!8746 (array!25085) Bool)

(assert (=> start!39194 (and (array_inv!8746 _values!549) e!247038)))

(declare-fun array_inv!8747 (array!25087) Bool)

(assert (=> start!39194 (array_inv!8747 _keys!709)))

(declare-fun b!413016 () Bool)

(assert (=> b!413016 (= e!247038 (and e!247041 mapRes!17541))))

(declare-fun condMapEmpty!17541 () Bool)

(declare-fun mapDefault!17541 () ValueCell!4963)

