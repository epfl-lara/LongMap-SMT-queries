; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39256 () Bool)

(assert start!39256)

(declare-fun b_free!9523 () Bool)

(declare-fun b_next!9523 () Bool)

(assert (=> start!39256 (= b_free!9523 (not b_next!9523))))

(declare-fun tp!34098 () Bool)

(declare-fun b_and!16921 () Bool)

(assert (=> start!39256 (= tp!34098 b_and!16921)))

(declare-fun b!414716 () Bool)

(declare-fun res!241172 () Bool)

(declare-fun e!247816 () Bool)

(assert (=> b!414716 (=> (not res!241172) (not e!247816))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414716 (= res!241172 (bvsle from!863 i!563))))

(declare-datatypes ((V!15339 0))(
  ( (V!15340 (val!5382 Int)) )
))
(declare-fun minValue!515 () V!15339)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28744 () Bool)

(declare-datatypes ((ValueCell!4994 0))(
  ( (ValueCellFull!4994 (v!7629 V!15339)) (EmptyCell!4994) )
))
(declare-datatypes ((array!25207 0))(
  ( (array!25208 (arr!12053 (Array (_ BitVec 32) ValueCell!4994)) (size!12405 (_ BitVec 32))) )
))
(declare-fun lt!190070 () array!25207)

(declare-fun _values!549 () array!25207)

(declare-fun zeroValue!515 () V!15339)

(declare-fun c!54998 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25209 0))(
  ( (array!25210 (arr!12054 (Array (_ BitVec 32) (_ BitVec 64))) (size!12406 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25209)

(declare-datatypes ((tuple2!7004 0))(
  ( (tuple2!7005 (_1!3513 (_ BitVec 64)) (_2!3513 V!15339)) )
))
(declare-datatypes ((List!7026 0))(
  ( (Nil!7023) (Cons!7022 (h!7878 tuple2!7004) (t!12214 List!7026)) )
))
(declare-datatypes ((ListLongMap!5917 0))(
  ( (ListLongMap!5918 (toList!2974 List!7026)) )
))
(declare-fun call!28748 () ListLongMap!5917)

(declare-fun lt!190071 () array!25209)

(declare-fun getCurrentListMapNoExtraKeys!1180 (array!25209 array!25207 (_ BitVec 32) (_ BitVec 32) V!15339 V!15339 (_ BitVec 32) Int) ListLongMap!5917)

(assert (=> bm!28744 (= call!28748 (getCurrentListMapNoExtraKeys!1180 (ite c!54998 _keys!709 lt!190071) (ite c!54998 _values!549 lt!190070) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414717 () Bool)

(declare-fun res!241170 () Bool)

(declare-fun e!247812 () Bool)

(assert (=> b!414717 (=> (not res!241170) (not e!247812))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414717 (= res!241170 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!414718 () Bool)

(declare-fun res!241171 () Bool)

(assert (=> b!414718 (=> (not res!241171) (not e!247812))))

(declare-datatypes ((List!7027 0))(
  ( (Nil!7024) (Cons!7023 (h!7879 (_ BitVec 64)) (t!12215 List!7027)) )
))
(declare-fun arrayNoDuplicates!0 (array!25209 (_ BitVec 32) List!7027) Bool)

(assert (=> b!414718 (= res!241171 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7024))))

(declare-fun b!414719 () Bool)

(declare-fun e!247814 () Bool)

(declare-fun e!247815 () Bool)

(assert (=> b!414719 (= e!247814 (not e!247815))))

(declare-fun res!241177 () Bool)

(assert (=> b!414719 (=> res!241177 e!247815)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414719 (= res!241177 (validKeyInArray!0 (select (arr!12054 _keys!709) from!863)))))

(declare-fun e!247818 () Bool)

(assert (=> b!414719 e!247818))

(assert (=> b!414719 (= c!54998 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun v!412 () V!15339)

(declare-datatypes ((Unit!12264 0))(
  ( (Unit!12265) )
))
(declare-fun lt!190069 () Unit!12264)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!390 (array!25209 array!25207 (_ BitVec 32) (_ BitVec 32) V!15339 V!15339 (_ BitVec 32) (_ BitVec 64) V!15339 (_ BitVec 32) Int) Unit!12264)

(assert (=> b!414719 (= lt!190069 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!390 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17634 () Bool)

(declare-fun mapRes!17634 () Bool)

(assert (=> mapIsEmpty!17634 mapRes!17634))

(declare-fun b!414720 () Bool)

(declare-fun res!241174 () Bool)

(assert (=> b!414720 (=> (not res!241174) (not e!247812))))

(assert (=> b!414720 (= res!241174 (validKeyInArray!0 k!794))))

(declare-fun b!414721 () Bool)

(declare-fun e!247810 () Bool)

(declare-fun e!247817 () Bool)

(assert (=> b!414721 (= e!247810 (and e!247817 mapRes!17634))))

(declare-fun condMapEmpty!17634 () Bool)

(declare-fun mapDefault!17634 () ValueCell!4994)

