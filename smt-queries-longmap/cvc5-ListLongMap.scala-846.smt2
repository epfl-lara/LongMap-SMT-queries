; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20172 () Bool)

(assert start!20172)

(declare-fun b_free!4831 () Bool)

(declare-fun b_next!4831 () Bool)

(assert (=> start!20172 (= b_free!4831 (not b_next!4831))))

(declare-fun tp!17525 () Bool)

(declare-fun b_and!11577 () Bool)

(assert (=> start!20172 (= tp!17525 b_and!11577)))

(declare-fun b!198014 () Bool)

(declare-fun e!130210 () Bool)

(declare-fun tp_is_empty!4687 () Bool)

(assert (=> b!198014 (= e!130210 tp_is_empty!4687)))

(declare-fun b!198016 () Bool)

(declare-fun e!130213 () Bool)

(assert (=> b!198016 (= e!130213 tp_is_empty!4687)))

(declare-fun b!198017 () Bool)

(declare-fun res!93790 () Bool)

(declare-fun e!130212 () Bool)

(assert (=> b!198017 (=> (not res!93790) (not e!130212))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8625 0))(
  ( (array!8626 (arr!4063 (Array (_ BitVec 32) (_ BitVec 64))) (size!4388 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8625)

(assert (=> b!198017 (= res!93790 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4388 _keys!825))))))

(declare-fun b!198018 () Bool)

(declare-fun res!93793 () Bool)

(assert (=> b!198018 (=> (not res!93793) (not e!130212))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8625 (_ BitVec 32)) Bool)

(assert (=> b!198018 (= res!93793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198019 () Bool)

(declare-fun res!93791 () Bool)

(assert (=> b!198019 (=> (not res!93791) (not e!130212))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198019 (= res!93791 (validKeyInArray!0 k!843))))

(declare-fun b!198015 () Bool)

(declare-fun res!93794 () Bool)

(assert (=> b!198015 (=> (not res!93794) (not e!130212))))

(declare-datatypes ((List!2538 0))(
  ( (Nil!2535) (Cons!2534 (h!3176 (_ BitVec 64)) (t!7469 List!2538)) )
))
(declare-fun arrayNoDuplicates!0 (array!8625 (_ BitVec 32) List!2538) Bool)

(assert (=> b!198015 (= res!93794 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2535))))

(declare-fun res!93796 () Bool)

(assert (=> start!20172 (=> (not res!93796) (not e!130212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20172 (= res!93796 (validMask!0 mask!1149))))

(assert (=> start!20172 e!130212))

(declare-datatypes ((V!5897 0))(
  ( (V!5898 (val!2388 Int)) )
))
(declare-datatypes ((ValueCell!2000 0))(
  ( (ValueCellFull!2000 (v!4358 V!5897)) (EmptyCell!2000) )
))
(declare-datatypes ((array!8627 0))(
  ( (array!8628 (arr!4064 (Array (_ BitVec 32) ValueCell!2000)) (size!4389 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8627)

(declare-fun e!130214 () Bool)

(declare-fun array_inv!2655 (array!8627) Bool)

(assert (=> start!20172 (and (array_inv!2655 _values!649) e!130214)))

(assert (=> start!20172 true))

(assert (=> start!20172 tp_is_empty!4687))

(declare-fun array_inv!2656 (array!8625) Bool)

(assert (=> start!20172 (array_inv!2656 _keys!825)))

(assert (=> start!20172 tp!17525))

(declare-fun b!198020 () Bool)

(declare-fun mapRes!8099 () Bool)

(assert (=> b!198020 (= e!130214 (and e!130210 mapRes!8099))))

(declare-fun condMapEmpty!8099 () Bool)

(declare-fun mapDefault!8099 () ValueCell!2000)

