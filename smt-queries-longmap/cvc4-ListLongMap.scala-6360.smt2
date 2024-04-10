; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81900 () Bool)

(assert start!81900)

(declare-fun b_free!18395 () Bool)

(declare-fun b_next!18395 () Bool)

(assert (=> start!81900 (= b_free!18395 (not b_next!18395))))

(declare-fun tp!63885 () Bool)

(declare-fun b_and!29881 () Bool)

(assert (=> start!81900 (= tp!63885 b_and!29881)))

(declare-fun res!639670 () Bool)

(declare-fun e!538151 () Bool)

(assert (=> start!81900 (=> (not res!639670) (not e!538151))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81900 (= res!639670 (validMask!0 mask!1823))))

(assert (=> start!81900 e!538151))

(assert (=> start!81900 true))

(declare-fun tp_is_empty!20939 () Bool)

(assert (=> start!81900 tp_is_empty!20939))

(declare-datatypes ((array!57983 0))(
  ( (array!57984 (arr!27871 (Array (_ BitVec 32) (_ BitVec 64))) (size!28350 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57983)

(declare-fun array_inv!21631 (array!57983) Bool)

(assert (=> start!81900 (array_inv!21631 _keys!1441)))

(declare-datatypes ((V!32901 0))(
  ( (V!32902 (val!10520 Int)) )
))
(declare-datatypes ((ValueCell!9988 0))(
  ( (ValueCellFull!9988 (v!13075 V!32901)) (EmptyCell!9988) )
))
(declare-datatypes ((array!57985 0))(
  ( (array!57986 (arr!27872 (Array (_ BitVec 32) ValueCell!9988)) (size!28351 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57985)

(declare-fun e!538153 () Bool)

(declare-fun array_inv!21632 (array!57985) Bool)

(assert (=> start!81900 (and (array_inv!21632 _values!1197) e!538153)))

(assert (=> start!81900 tp!63885))

(declare-fun b!955227 () Bool)

(declare-fun e!538149 () Bool)

(assert (=> b!955227 (= e!538149 tp_is_empty!20939)))

(declare-fun b!955228 () Bool)

(declare-fun res!639669 () Bool)

(assert (=> b!955228 (=> (not res!639669) (not e!538151))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!955228 (= res!639669 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28350 _keys!1441))))))

(declare-fun b!955229 () Bool)

(declare-fun res!639667 () Bool)

(assert (=> b!955229 (=> (not res!639667) (not e!538151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955229 (= res!639667 (validKeyInArray!0 (select (arr!27871 _keys!1441) i!735)))))

(declare-fun b!955230 () Bool)

(declare-fun e!538150 () Bool)

(declare-fun mapRes!33370 () Bool)

(assert (=> b!955230 (= e!538153 (and e!538150 mapRes!33370))))

(declare-fun condMapEmpty!33370 () Bool)

(declare-fun mapDefault!33370 () ValueCell!9988)

