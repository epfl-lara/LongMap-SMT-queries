; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41318 () Bool)

(assert start!41318)

(declare-fun res!276345 () Bool)

(declare-fun e!269529 () Bool)

(assert (=> start!41318 (=> (not res!276345) (not e!269529))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41318 (= res!276345 (validMask!0 mask!1365))))

(assert (=> start!41318 e!269529))

(assert (=> start!41318 true))

(declare-datatypes ((array!28713 0))(
  ( (array!28714 (arr!13792 (Array (_ BitVec 32) (_ BitVec 64))) (size!14144 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28713)

(declare-fun array_inv!9974 (array!28713) Bool)

(assert (=> start!41318 (array_inv!9974 _keys!1025)))

(declare-datatypes ((V!17715 0))(
  ( (V!17716 (val!6273 Int)) )
))
(declare-datatypes ((ValueCell!5885 0))(
  ( (ValueCellFull!5885 (v!8559 V!17715)) (EmptyCell!5885) )
))
(declare-datatypes ((array!28715 0))(
  ( (array!28716 (arr!13793 (Array (_ BitVec 32) ValueCell!5885)) (size!14145 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28715)

(declare-fun e!269531 () Bool)

(declare-fun array_inv!9975 (array!28715) Bool)

(assert (=> start!41318 (and (array_inv!9975 _values!833) e!269531)))

(declare-fun mapIsEmpty!20350 () Bool)

(declare-fun mapRes!20350 () Bool)

(assert (=> mapIsEmpty!20350 mapRes!20350))

(declare-fun mapNonEmpty!20350 () Bool)

(declare-fun tp!39169 () Bool)

(declare-fun e!269530 () Bool)

(assert (=> mapNonEmpty!20350 (= mapRes!20350 (and tp!39169 e!269530))))

(declare-fun mapValue!20350 () ValueCell!5885)

(declare-fun mapKey!20350 () (_ BitVec 32))

(declare-fun mapRest!20350 () (Array (_ BitVec 32) ValueCell!5885))

(assert (=> mapNonEmpty!20350 (= (arr!13793 _values!833) (store mapRest!20350 mapKey!20350 mapValue!20350))))

(declare-fun b!462037 () Bool)

(declare-fun e!269532 () Bool)

(assert (=> b!462037 (= e!269531 (and e!269532 mapRes!20350))))

(declare-fun condMapEmpty!20350 () Bool)

(declare-fun mapDefault!20350 () ValueCell!5885)

