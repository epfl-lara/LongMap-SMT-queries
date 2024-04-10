; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41304 () Bool)

(assert start!41304)

(declare-fun b!461961 () Bool)

(declare-fun e!269473 () Bool)

(declare-fun e!269469 () Bool)

(declare-fun mapRes!20338 () Bool)

(assert (=> b!461961 (= e!269473 (and e!269469 mapRes!20338))))

(declare-fun condMapEmpty!20338 () Bool)

(declare-datatypes ((V!17707 0))(
  ( (V!17708 (val!6270 Int)) )
))
(declare-datatypes ((ValueCell!5882 0))(
  ( (ValueCellFull!5882 (v!8556 V!17707)) (EmptyCell!5882) )
))
(declare-datatypes ((array!28701 0))(
  ( (array!28702 (arr!13787 (Array (_ BitVec 32) ValueCell!5882)) (size!14139 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28701)

(declare-fun mapDefault!20338 () ValueCell!5882)

