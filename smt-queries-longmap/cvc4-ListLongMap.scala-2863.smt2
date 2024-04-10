; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41238 () Bool)

(assert start!41238)

(declare-fun b_free!11081 () Bool)

(declare-fun b_next!11081 () Bool)

(assert (=> start!41238 (= b_free!11081 (not b_next!11081))))

(declare-fun tp!39082 () Bool)

(declare-fun b_and!19401 () Bool)

(assert (=> start!41238 (= tp!39082 b_and!19401)))

(declare-fun mapNonEmpty!20281 () Bool)

(declare-fun mapRes!20281 () Bool)

(declare-fun tp!39081 () Bool)

(declare-fun e!269074 () Bool)

(assert (=> mapNonEmpty!20281 (= mapRes!20281 (and tp!39081 e!269074))))

(declare-datatypes ((V!17663 0))(
  ( (V!17664 (val!6254 Int)) )
))
(declare-datatypes ((ValueCell!5866 0))(
  ( (ValueCellFull!5866 (v!8536 V!17663)) (EmptyCell!5866) )
))
(declare-fun mapValue!20281 () ValueCell!5866)

(declare-fun mapRest!20281 () (Array (_ BitVec 32) ValueCell!5866))

(declare-fun mapKey!20281 () (_ BitVec 32))

(declare-datatypes ((array!28637 0))(
  ( (array!28638 (arr!13758 (Array (_ BitVec 32) ValueCell!5866)) (size!14110 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28637)

(assert (=> mapNonEmpty!20281 (= (arr!13758 _values!549) (store mapRest!20281 mapKey!20281 mapValue!20281))))

(declare-fun b!461341 () Bool)

(declare-fun res!275942 () Bool)

(declare-fun e!269073 () Bool)

(assert (=> b!461341 (=> (not res!275942) (not e!269073))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461341 (= res!275942 (bvsle from!863 i!563))))

(declare-fun res!275938 () Bool)

(declare-fun e!269069 () Bool)

(assert (=> start!41238 (=> (not res!275938) (not e!269069))))

(declare-datatypes ((array!28639 0))(
  ( (array!28640 (arr!13759 (Array (_ BitVec 32) (_ BitVec 64))) (size!14111 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28639)

(assert (=> start!41238 (= res!275938 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14111 _keys!709))))))

(assert (=> start!41238 e!269069))

(declare-fun tp_is_empty!12419 () Bool)

(assert (=> start!41238 tp_is_empty!12419))

(assert (=> start!41238 tp!39082))

(assert (=> start!41238 true))

(declare-fun e!269071 () Bool)

(declare-fun array_inv!9954 (array!28637) Bool)

(assert (=> start!41238 (and (array_inv!9954 _values!549) e!269071)))

(declare-fun array_inv!9955 (array!28639) Bool)

(assert (=> start!41238 (array_inv!9955 _keys!709)))

(declare-fun mapIsEmpty!20281 () Bool)

(assert (=> mapIsEmpty!20281 mapRes!20281))

(declare-fun b!461342 () Bool)

(declare-fun res!275945 () Bool)

(assert (=> b!461342 (=> (not res!275945) (not e!269069))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461342 (= res!275945 (validKeyInArray!0 k!794))))

(declare-fun b!461343 () Bool)

(declare-fun res!275940 () Bool)

(assert (=> b!461343 (=> (not res!275940) (not e!269069))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461343 (= res!275940 (validMask!0 mask!1025))))

(declare-fun b!461344 () Bool)

(declare-fun e!269072 () Bool)

(assert (=> b!461344 (= e!269071 (and e!269072 mapRes!20281))))

(declare-fun condMapEmpty!20281 () Bool)

(declare-fun mapDefault!20281 () ValueCell!5866)

