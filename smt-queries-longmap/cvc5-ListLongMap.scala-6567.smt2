; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83286 () Bool)

(assert start!83286)

(declare-fun b_free!19279 () Bool)

(declare-fun b_next!19279 () Bool)

(assert (=> start!83286 (= b_free!19279 (not b_next!19279))))

(declare-fun tp!67116 () Bool)

(declare-fun b_and!30779 () Bool)

(assert (=> start!83286 (= tp!67116 b_and!30779)))

(declare-fun b!972021 () Bool)

(declare-fun res!650623 () Bool)

(declare-fun e!547912 () Bool)

(assert (=> b!972021 (=> (not res!650623) (not e!547912))))

(declare-datatypes ((array!60401 0))(
  ( (array!60402 (arr!29064 (Array (_ BitVec 32) (_ BitVec 64))) (size!29543 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60401)

(declare-datatypes ((List!20148 0))(
  ( (Nil!20145) (Cons!20144 (h!21306 (_ BitVec 64)) (t!28525 List!20148)) )
))
(declare-fun arrayNoDuplicates!0 (array!60401 (_ BitVec 32) List!20148) Bool)

(assert (=> b!972021 (= res!650623 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20145))))

(declare-fun b!972022 () Bool)

(declare-fun e!547910 () Bool)

(declare-fun tp_is_empty!22177 () Bool)

(assert (=> b!972022 (= e!547910 tp_is_empty!22177)))

(declare-fun b!972023 () Bool)

(declare-fun e!547914 () Bool)

(declare-fun mapRes!35275 () Bool)

(assert (=> b!972023 (= e!547914 (and e!547910 mapRes!35275))))

(declare-fun condMapEmpty!35275 () Bool)

(declare-datatypes ((V!34553 0))(
  ( (V!34554 (val!11139 Int)) )
))
(declare-datatypes ((ValueCell!10607 0))(
  ( (ValueCellFull!10607 (v!13698 V!34553)) (EmptyCell!10607) )
))
(declare-datatypes ((array!60403 0))(
  ( (array!60404 (arr!29065 (Array (_ BitVec 32) ValueCell!10607)) (size!29544 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60403)

(declare-fun mapDefault!35275 () ValueCell!10607)

