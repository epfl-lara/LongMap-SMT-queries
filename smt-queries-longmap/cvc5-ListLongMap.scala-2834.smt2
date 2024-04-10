; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40968 () Bool)

(assert start!40968)

(declare-fun b_free!10903 () Bool)

(declare-fun b_next!10903 () Bool)

(assert (=> start!40968 (= b_free!10903 (not b_next!10903))))

(declare-fun tp!38535 () Bool)

(declare-fun b_and!19045 () Bool)

(assert (=> start!40968 (= tp!38535 b_and!19045)))

(declare-fun b!455942 () Bool)

(declare-fun res!271969 () Bool)

(declare-fun e!266481 () Bool)

(assert (=> b!455942 (=> (not res!271969) (not e!266481))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455942 (= res!271969 (bvsle from!863 i!563))))

(declare-fun b!455943 () Bool)

(declare-fun res!271978 () Bool)

(declare-fun e!266480 () Bool)

(assert (=> b!455943 (=> (not res!271978) (not e!266480))))

(declare-datatypes ((array!28285 0))(
  ( (array!28286 (arr!13586 (Array (_ BitVec 32) (_ BitVec 64))) (size!13938 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28285)

(assert (=> b!455943 (= res!271978 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13938 _keys!709))))))

(declare-fun b!455944 () Bool)

(declare-fun res!271972 () Bool)

(assert (=> b!455944 (=> (not res!271972) (not e!266480))))

(assert (=> b!455944 (= res!271972 (or (= (select (arr!13586 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13586 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455945 () Bool)

(declare-fun res!271977 () Bool)

(assert (=> b!455945 (=> (not res!271977) (not e!266480))))

(declare-datatypes ((List!8193 0))(
  ( (Nil!8190) (Cons!8189 (h!9045 (_ BitVec 64)) (t!14021 List!8193)) )
))
(declare-fun arrayNoDuplicates!0 (array!28285 (_ BitVec 32) List!8193) Bool)

(assert (=> b!455945 (= res!271977 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8190))))

(declare-fun res!271979 () Bool)

(assert (=> start!40968 (=> (not res!271979) (not e!266480))))

(assert (=> start!40968 (= res!271979 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13938 _keys!709))))))

(assert (=> start!40968 e!266480))

(declare-fun tp_is_empty!12241 () Bool)

(assert (=> start!40968 tp_is_empty!12241))

(assert (=> start!40968 tp!38535))

(assert (=> start!40968 true))

(declare-datatypes ((V!17427 0))(
  ( (V!17428 (val!6165 Int)) )
))
(declare-datatypes ((ValueCell!5777 0))(
  ( (ValueCellFull!5777 (v!8431 V!17427)) (EmptyCell!5777) )
))
(declare-datatypes ((array!28287 0))(
  ( (array!28288 (arr!13587 (Array (_ BitVec 32) ValueCell!5777)) (size!13939 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28287)

(declare-fun e!266483 () Bool)

(declare-fun array_inv!9848 (array!28287) Bool)

(assert (=> start!40968 (and (array_inv!9848 _values!549) e!266483)))

(declare-fun array_inv!9849 (array!28285) Bool)

(assert (=> start!40968 (array_inv!9849 _keys!709)))

(declare-fun b!455946 () Bool)

(declare-fun res!271973 () Bool)

(assert (=> b!455946 (=> (not res!271973) (not e!266480))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455946 (= res!271973 (validMask!0 mask!1025))))

(declare-fun b!455947 () Bool)

(declare-fun e!266484 () Bool)

(assert (=> b!455947 (= e!266484 tp_is_empty!12241)))

(declare-fun b!455948 () Bool)

(declare-fun res!271971 () Bool)

(assert (=> b!455948 (=> (not res!271971) (not e!266481))))

(declare-fun lt!206436 () array!28285)

(assert (=> b!455948 (= res!271971 (arrayNoDuplicates!0 lt!206436 #b00000000000000000000000000000000 Nil!8190))))

(declare-fun b!455949 () Bool)

(declare-fun res!271976 () Bool)

(assert (=> b!455949 (=> (not res!271976) (not e!266480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28285 (_ BitVec 32)) Bool)

(assert (=> b!455949 (= res!271976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455950 () Bool)

(declare-fun e!266482 () Bool)

(declare-fun mapRes!20002 () Bool)

(assert (=> b!455950 (= e!266483 (and e!266482 mapRes!20002))))

(declare-fun condMapEmpty!20002 () Bool)

(declare-fun mapDefault!20002 () ValueCell!5777)

