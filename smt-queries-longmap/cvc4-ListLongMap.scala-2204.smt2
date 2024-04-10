; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36630 () Bool)

(assert start!36630)

(declare-fun b!365594 () Bool)

(declare-fun e!223891 () Bool)

(assert (=> b!365594 (= e!223891 false)))

(declare-fun lt!169196 () Bool)

(declare-datatypes ((array!20889 0))(
  ( (array!20890 (arr!9917 (Array (_ BitVec 32) (_ BitVec 64))) (size!10269 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20889)

(declare-datatypes ((List!5530 0))(
  ( (Nil!5527) (Cons!5526 (h!6382 (_ BitVec 64)) (t!10680 List!5530)) )
))
(declare-fun arrayNoDuplicates!0 (array!20889 (_ BitVec 32) List!5530) Bool)

(assert (=> b!365594 (= lt!169196 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5527))))

(declare-fun res!204410 () Bool)

(assert (=> start!36630 (=> (not res!204410) (not e!223891))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36630 (= res!204410 (validMask!0 mask!970))))

(assert (=> start!36630 e!223891))

(assert (=> start!36630 true))

(declare-datatypes ((V!12391 0))(
  ( (V!12392 (val!4277 Int)) )
))
(declare-datatypes ((ValueCell!3889 0))(
  ( (ValueCellFull!3889 (v!6473 V!12391)) (EmptyCell!3889) )
))
(declare-datatypes ((array!20891 0))(
  ( (array!20892 (arr!9918 (Array (_ BitVec 32) ValueCell!3889)) (size!10270 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20891)

(declare-fun e!223890 () Bool)

(declare-fun array_inv!7344 (array!20891) Bool)

(assert (=> start!36630 (and (array_inv!7344 _values!506) e!223890)))

(declare-fun array_inv!7345 (array!20889) Bool)

(assert (=> start!36630 (array_inv!7345 _keys!658)))

(declare-fun b!365595 () Bool)

(declare-fun e!223892 () Bool)

(declare-fun tp_is_empty!8465 () Bool)

(assert (=> b!365595 (= e!223892 tp_is_empty!8465)))

(declare-fun mapIsEmpty!14250 () Bool)

(declare-fun mapRes!14250 () Bool)

(assert (=> mapIsEmpty!14250 mapRes!14250))

(declare-fun b!365596 () Bool)

(declare-fun res!204411 () Bool)

(assert (=> b!365596 (=> (not res!204411) (not e!223891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20889 (_ BitVec 32)) Bool)

(assert (=> b!365596 (= res!204411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365597 () Bool)

(declare-fun e!223889 () Bool)

(assert (=> b!365597 (= e!223890 (and e!223889 mapRes!14250))))

(declare-fun condMapEmpty!14250 () Bool)

(declare-fun mapDefault!14250 () ValueCell!3889)

