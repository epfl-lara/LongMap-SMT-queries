; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39586 () Bool)

(assert start!39586)

(declare-fun b_free!9853 () Bool)

(declare-fun b_next!9853 () Bool)

(assert (=> start!39586 (= b_free!9853 (not b_next!9853))))

(declare-fun tp!35088 () Bool)

(declare-fun b_and!17509 () Bool)

(assert (=> start!39586 (= tp!35088 b_and!17509)))

(declare-fun b!423939 () Bool)

(declare-fun res!247887 () Bool)

(declare-fun e!251937 () Bool)

(assert (=> b!423939 (=> (not res!247887) (not e!251937))))

(declare-datatypes ((array!25851 0))(
  ( (array!25852 (arr!12375 (Array (_ BitVec 32) (_ BitVec 64))) (size!12727 (_ BitVec 32))) )
))
(declare-fun lt!194270 () array!25851)

(declare-datatypes ((List!7296 0))(
  ( (Nil!7293) (Cons!7292 (h!8148 (_ BitVec 64)) (t!12740 List!7296)) )
))
(declare-fun arrayNoDuplicates!0 (array!25851 (_ BitVec 32) List!7296) Bool)

(assert (=> b!423939 (= res!247887 (arrayNoDuplicates!0 lt!194270 #b00000000000000000000000000000000 Nil!7293))))

(declare-fun b!423940 () Bool)

(declare-fun res!247879 () Bool)

(declare-fun e!251935 () Bool)

(assert (=> b!423940 (=> (not res!247879) (not e!251935))))

(declare-fun _keys!709 () array!25851)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423940 (= res!247879 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!423941 () Bool)

(declare-fun res!247880 () Bool)

(assert (=> b!423941 (=> (not res!247880) (not e!251935))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423941 (= res!247880 (or (= (select (arr!12375 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12375 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423942 () Bool)

(declare-fun res!247878 () Bool)

(assert (=> b!423942 (=> (not res!247878) (not e!251935))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25851 (_ BitVec 32)) Bool)

(assert (=> b!423942 (= res!247878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!247884 () Bool)

(assert (=> start!39586 (=> (not res!247884) (not e!251935))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39586 (= res!247884 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12727 _keys!709))))))

(assert (=> start!39586 e!251935))

(declare-fun tp_is_empty!11005 () Bool)

(assert (=> start!39586 tp_is_empty!11005))

(assert (=> start!39586 tp!35088))

(assert (=> start!39586 true))

(declare-datatypes ((V!15779 0))(
  ( (V!15780 (val!5547 Int)) )
))
(declare-datatypes ((ValueCell!5159 0))(
  ( (ValueCellFull!5159 (v!7794 V!15779)) (EmptyCell!5159) )
))
(declare-datatypes ((array!25853 0))(
  ( (array!25854 (arr!12376 (Array (_ BitVec 32) ValueCell!5159)) (size!12728 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25853)

(declare-fun e!251940 () Bool)

(declare-fun array_inv!9020 (array!25853) Bool)

(assert (=> start!39586 (and (array_inv!9020 _values!549) e!251940)))

(declare-fun array_inv!9021 (array!25851) Bool)

(assert (=> start!39586 (array_inv!9021 _keys!709)))

(declare-fun b!423943 () Bool)

(declare-fun e!251938 () Bool)

(assert (=> b!423943 (= e!251938 tp_is_empty!11005)))

(declare-fun b!423944 () Bool)

(declare-fun res!247885 () Bool)

(assert (=> b!423944 (=> (not res!247885) (not e!251935))))

(assert (=> b!423944 (= res!247885 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7293))))

(declare-fun b!423945 () Bool)

(declare-fun res!247882 () Bool)

(assert (=> b!423945 (=> (not res!247882) (not e!251935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423945 (= res!247882 (validKeyInArray!0 k!794))))

(declare-fun b!423946 () Bool)

(declare-fun e!251936 () Bool)

(declare-fun mapRes!18129 () Bool)

(assert (=> b!423946 (= e!251940 (and e!251936 mapRes!18129))))

(declare-fun condMapEmpty!18129 () Bool)

(declare-fun mapDefault!18129 () ValueCell!5159)

