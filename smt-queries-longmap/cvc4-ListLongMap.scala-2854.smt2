; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41158 () Bool)

(assert start!41158)

(declare-fun b_free!11027 () Bool)

(declare-fun b_next!11027 () Bool)

(assert (=> start!41158 (= b_free!11027 (not b_next!11027))))

(declare-fun tp!38917 () Bool)

(declare-fun b_and!19293 () Bool)

(assert (=> start!41158 (= tp!38917 b_and!19293)))

(declare-fun res!274711 () Bool)

(declare-fun e!268244 () Bool)

(assert (=> start!41158 (=> (not res!274711) (not e!268244))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28531 0))(
  ( (array!28532 (arr!13706 (Array (_ BitVec 32) (_ BitVec 64))) (size!14058 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28531)

(assert (=> start!41158 (= res!274711 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14058 _keys!709))))))

(assert (=> start!41158 e!268244))

(declare-fun tp_is_empty!12365 () Bool)

(assert (=> start!41158 tp_is_empty!12365))

(assert (=> start!41158 tp!38917))

(assert (=> start!41158 true))

(declare-datatypes ((V!17591 0))(
  ( (V!17592 (val!6227 Int)) )
))
(declare-datatypes ((ValueCell!5839 0))(
  ( (ValueCellFull!5839 (v!8505 V!17591)) (EmptyCell!5839) )
))
(declare-datatypes ((array!28533 0))(
  ( (array!28534 (arr!13707 (Array (_ BitVec 32) ValueCell!5839)) (size!14059 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28533)

(declare-fun e!268246 () Bool)

(declare-fun array_inv!9912 (array!28533) Bool)

(assert (=> start!41158 (and (array_inv!9912 _values!549) e!268246)))

(declare-fun array_inv!9913 (array!28531) Bool)

(assert (=> start!41158 (array_inv!9913 _keys!709)))

(declare-fun b!459637 () Bool)

(declare-fun e!268242 () Bool)

(declare-fun mapRes!20197 () Bool)

(assert (=> b!459637 (= e!268246 (and e!268242 mapRes!20197))))

(declare-fun condMapEmpty!20197 () Bool)

(declare-fun mapDefault!20197 () ValueCell!5839)

