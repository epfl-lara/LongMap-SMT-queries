; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41010 () Bool)

(assert start!41010)

(declare-fun b_free!10945 () Bool)

(declare-fun b_next!10945 () Bool)

(assert (=> start!41010 (= b_free!10945 (not b_next!10945))))

(declare-fun tp!38662 () Bool)

(declare-fun b_and!19087 () Bool)

(assert (=> start!41010 (= tp!38662 b_and!19087)))

(declare-fun b!456945 () Bool)

(declare-fun res!272791 () Bool)

(declare-fun e!266916 () Bool)

(assert (=> b!456945 (=> (not res!272791) (not e!266916))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456945 (= res!272791 (bvsle from!863 i!563))))

(declare-fun b!456946 () Bool)

(declare-fun e!266920 () Bool)

(declare-datatypes ((V!17483 0))(
  ( (V!17484 (val!6186 Int)) )
))
(declare-datatypes ((ValueCell!5798 0))(
  ( (ValueCellFull!5798 (v!8452 V!17483)) (EmptyCell!5798) )
))
(declare-datatypes ((array!28367 0))(
  ( (array!28368 (arr!13627 (Array (_ BitVec 32) ValueCell!5798)) (size!13979 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28367)

(assert (=> b!456946 (= e!266920 (bvslt from!863 (size!13979 _values!549)))))

(declare-fun b!456947 () Bool)

(declare-fun res!272793 () Bool)

(declare-fun e!266922 () Bool)

(assert (=> b!456947 (=> (not res!272793) (not e!266922))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456947 (= res!272793 (validKeyInArray!0 k!794))))

(declare-fun b!456949 () Bool)

(declare-fun res!272784 () Bool)

(assert (=> b!456949 (=> (not res!272784) (not e!266916))))

(declare-datatypes ((array!28369 0))(
  ( (array!28370 (arr!13628 (Array (_ BitVec 32) (_ BitVec 64))) (size!13980 (_ BitVec 32))) )
))
(declare-fun lt!206705 () array!28369)

(declare-datatypes ((List!8221 0))(
  ( (Nil!8218) (Cons!8217 (h!9073 (_ BitVec 64)) (t!14049 List!8221)) )
))
(declare-fun arrayNoDuplicates!0 (array!28369 (_ BitVec 32) List!8221) Bool)

(assert (=> b!456949 (= res!272784 (arrayNoDuplicates!0 lt!206705 #b00000000000000000000000000000000 Nil!8218))))

(declare-fun b!456950 () Bool)

(declare-fun e!266921 () Bool)

(declare-fun e!266919 () Bool)

(declare-fun mapRes!20065 () Bool)

(assert (=> b!456950 (= e!266921 (and e!266919 mapRes!20065))))

(declare-fun condMapEmpty!20065 () Bool)

(declare-fun mapDefault!20065 () ValueCell!5798)

