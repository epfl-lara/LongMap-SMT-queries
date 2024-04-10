; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81846 () Bool)

(assert start!81846)

(declare-fun b_free!18341 () Bool)

(declare-fun b_next!18341 () Bool)

(assert (=> start!81846 (= b_free!18341 (not b_next!18341))))

(declare-fun tp!63723 () Bool)

(declare-fun b_and!29827 () Bool)

(assert (=> start!81846 (= tp!63723 b_and!29827)))

(declare-fun b!954481 () Bool)

(declare-fun res!639168 () Bool)

(declare-fun e!537746 () Bool)

(assert (=> b!954481 (=> (not res!639168) (not e!537746))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57883 0))(
  ( (array!57884 (arr!27821 (Array (_ BitVec 32) (_ BitVec 64))) (size!28300 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57883)

(assert (=> b!954481 (= res!639168 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28300 _keys!1441))))))

(declare-fun res!639166 () Bool)

(assert (=> start!81846 (=> (not res!639166) (not e!537746))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81846 (= res!639166 (validMask!0 mask!1823))))

(assert (=> start!81846 e!537746))

(assert (=> start!81846 true))

(declare-fun tp_is_empty!20885 () Bool)

(assert (=> start!81846 tp_is_empty!20885))

(declare-fun array_inv!21601 (array!57883) Bool)

(assert (=> start!81846 (array_inv!21601 _keys!1441)))

(declare-datatypes ((V!32829 0))(
  ( (V!32830 (val!10493 Int)) )
))
(declare-datatypes ((ValueCell!9961 0))(
  ( (ValueCellFull!9961 (v!13048 V!32829)) (EmptyCell!9961) )
))
(declare-datatypes ((array!57885 0))(
  ( (array!57886 (arr!27822 (Array (_ BitVec 32) ValueCell!9961)) (size!28301 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57885)

(declare-fun e!537744 () Bool)

(declare-fun array_inv!21602 (array!57885) Bool)

(assert (=> start!81846 (and (array_inv!21602 _values!1197) e!537744)))

(assert (=> start!81846 tp!63723))

(declare-fun b!954482 () Bool)

(declare-fun e!537745 () Bool)

(assert (=> b!954482 (= e!537745 tp_is_empty!20885)))

(declare-fun b!954483 () Bool)

(declare-fun mapRes!33289 () Bool)

(assert (=> b!954483 (= e!537744 (and e!537745 mapRes!33289))))

(declare-fun condMapEmpty!33289 () Bool)

(declare-fun mapDefault!33289 () ValueCell!9961)

