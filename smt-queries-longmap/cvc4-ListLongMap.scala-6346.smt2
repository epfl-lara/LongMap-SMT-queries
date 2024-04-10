; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81804 () Bool)

(assert start!81804)

(declare-fun b!954042 () Bool)

(declare-fun res!638873 () Bool)

(declare-fun e!537492 () Bool)

(assert (=> b!954042 (=> (not res!638873) (not e!537492))))

(declare-datatypes ((array!57821 0))(
  ( (array!57822 (arr!27791 (Array (_ BitVec 32) (_ BitVec 64))) (size!28270 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57821)

(assert (=> b!954042 (= res!638873 (and (bvsle #b00000000000000000000000000000000 (size!28270 _keys!1441)) (bvslt (size!28270 _keys!1441) #b01111111111111111111111111111111)))))

(declare-fun b!954043 () Bool)

(declare-fun res!638878 () Bool)

(assert (=> b!954043 (=> (not res!638878) (not e!537492))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57821 (_ BitVec 32)) Bool)

(assert (=> b!954043 (= res!638878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33241 () Bool)

(declare-fun mapRes!33241 () Bool)

(assert (=> mapIsEmpty!33241 mapRes!33241))

(declare-fun b!954044 () Bool)

(declare-fun e!537491 () Bool)

(declare-fun e!537489 () Bool)

(assert (=> b!954044 (= e!537491 (and e!537489 mapRes!33241))))

(declare-fun condMapEmpty!33241 () Bool)

(declare-datatypes ((V!32789 0))(
  ( (V!32790 (val!10478 Int)) )
))
(declare-datatypes ((ValueCell!9946 0))(
  ( (ValueCellFull!9946 (v!13032 V!32789)) (EmptyCell!9946) )
))
(declare-datatypes ((array!57823 0))(
  ( (array!57824 (arr!27792 (Array (_ BitVec 32) ValueCell!9946)) (size!28271 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57823)

(declare-fun mapDefault!33241 () ValueCell!9946)

