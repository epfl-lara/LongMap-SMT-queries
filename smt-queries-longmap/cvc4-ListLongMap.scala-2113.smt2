; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35850 () Bool)

(assert start!35850)

(declare-fun b!360348 () Bool)

(declare-fun res!200394 () Bool)

(declare-fun e!220648 () Bool)

(assert (=> b!360348 (=> (not res!200394) (not e!220648))))

(declare-datatypes ((array!20157 0))(
  ( (array!20158 (arr!9572 (Array (_ BitVec 32) (_ BitVec 64))) (size!9924 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20157)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!360348 (= res!200394 (not (= (select (arr!9572 _keys!1456) from!1805) k!1077)))))

(declare-fun b!360349 () Bool)

(declare-fun res!200389 () Bool)

(assert (=> b!360349 (=> (not res!200389) (not e!220648))))

(declare-fun arrayContainsKey!0 (array!20157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360349 (= res!200389 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun res!200390 () Bool)

(assert (=> start!35850 (=> (not res!200390) (not e!220648))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35850 (= res!200390 (validMask!0 mask!1842))))

(assert (=> start!35850 e!220648))

(declare-fun tp_is_empty!8303 () Bool)

(assert (=> start!35850 tp_is_empty!8303))

(assert (=> start!35850 true))

(declare-fun array_inv!7040 (array!20157) Bool)

(assert (=> start!35850 (array_inv!7040 _keys!1456)))

(declare-datatypes ((V!12047 0))(
  ( (V!12048 (val!4196 Int)) )
))
(declare-datatypes ((ValueCell!3808 0))(
  ( (ValueCellFull!3808 (v!6390 V!12047)) (EmptyCell!3808) )
))
(declare-datatypes ((array!20159 0))(
  ( (array!20160 (arr!9573 (Array (_ BitVec 32) ValueCell!3808)) (size!9925 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20159)

(declare-fun e!220652 () Bool)

(declare-fun array_inv!7041 (array!20159) Bool)

(assert (=> start!35850 (and (array_inv!7041 _values!1208) e!220652)))

(declare-fun b!360350 () Bool)

(declare-fun res!200395 () Bool)

(assert (=> b!360350 (=> (not res!200395) (not e!220648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20157 (_ BitVec 32)) Bool)

(assert (=> b!360350 (= res!200395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13962 () Bool)

(declare-fun mapRes!13962 () Bool)

(assert (=> mapIsEmpty!13962 mapRes!13962))

(declare-fun b!360351 () Bool)

(declare-fun e!220651 () Bool)

(assert (=> b!360351 (= e!220651 tp_is_empty!8303)))

(declare-fun b!360352 () Bool)

(declare-fun res!200393 () Bool)

(assert (=> b!360352 (=> (not res!200393) (not e!220648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360352 (= res!200393 (validKeyInArray!0 k!1077))))

(declare-fun b!360353 () Bool)

(assert (=> b!360353 (= e!220652 (and e!220651 mapRes!13962))))

(declare-fun condMapEmpty!13962 () Bool)

(declare-fun mapDefault!13962 () ValueCell!3808)

