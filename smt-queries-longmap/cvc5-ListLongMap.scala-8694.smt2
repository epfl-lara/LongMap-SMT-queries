; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105584 () Bool)

(assert start!105584)

(declare-fun b_free!27199 () Bool)

(declare-fun b_next!27199 () Bool)

(assert (=> start!105584 (= b_free!27199 (not b_next!27199))))

(declare-fun tp!95116 () Bool)

(declare-fun b_and!45065 () Bool)

(assert (=> start!105584 (= tp!95116 b_and!45065)))

(declare-fun b!1257805 () Bool)

(declare-fun res!838405 () Bool)

(declare-fun e!715273 () Bool)

(assert (=> b!1257805 (=> (not res!838405) (not e!715273))))

(declare-datatypes ((array!81832 0))(
  ( (array!81833 (arr!39473 (Array (_ BitVec 32) (_ BitVec 64))) (size!40009 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81832)

(declare-datatypes ((List!28033 0))(
  ( (Nil!28030) (Cons!28029 (h!29238 (_ BitVec 64)) (t!41524 List!28033)) )
))
(declare-fun arrayNoDuplicates!0 (array!81832 (_ BitVec 32) List!28033) Bool)

(assert (=> b!1257805 (= res!838405 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28030))))

(declare-fun b!1257806 () Bool)

(declare-fun res!838403 () Bool)

(assert (=> b!1257806 (=> (not res!838403) (not e!715273))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81832 (_ BitVec 32)) Bool)

(assert (=> b!1257806 (= res!838403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257807 () Bool)

(declare-fun e!715272 () Bool)

(declare-fun tp_is_empty!32101 () Bool)

(assert (=> b!1257807 (= e!715272 tp_is_empty!32101)))

(declare-fun mapNonEmpty!49942 () Bool)

(declare-fun mapRes!49942 () Bool)

(declare-fun tp!95117 () Bool)

(assert (=> mapNonEmpty!49942 (= mapRes!49942 (and tp!95117 e!715272))))

(declare-datatypes ((V!48167 0))(
  ( (V!48168 (val!16113 Int)) )
))
(declare-datatypes ((ValueCell!15287 0))(
  ( (ValueCellFull!15287 (v!18815 V!48167)) (EmptyCell!15287) )
))
(declare-fun mapValue!49942 () ValueCell!15287)

(declare-fun mapKey!49942 () (_ BitVec 32))

(declare-fun mapRest!49942 () (Array (_ BitVec 32) ValueCell!15287))

(declare-datatypes ((array!81834 0))(
  ( (array!81835 (arr!39474 (Array (_ BitVec 32) ValueCell!15287)) (size!40010 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81834)

(assert (=> mapNonEmpty!49942 (= (arr!39474 _values!914) (store mapRest!49942 mapKey!49942 mapValue!49942))))

(declare-fun res!838402 () Bool)

(assert (=> start!105584 (=> (not res!838402) (not e!715273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105584 (= res!838402 (validMask!0 mask!1466))))

(assert (=> start!105584 e!715273))

(assert (=> start!105584 true))

(assert (=> start!105584 tp!95116))

(assert (=> start!105584 tp_is_empty!32101))

(declare-fun array_inv!30067 (array!81832) Bool)

(assert (=> start!105584 (array_inv!30067 _keys!1118)))

(declare-fun e!715276 () Bool)

(declare-fun array_inv!30068 (array!81834) Bool)

(assert (=> start!105584 (and (array_inv!30068 _values!914) e!715276)))

(declare-fun b!1257808 () Bool)

(declare-fun e!715274 () Bool)

(assert (=> b!1257808 (= e!715274 tp_is_empty!32101)))

(declare-fun b!1257809 () Bool)

(assert (=> b!1257809 (= e!715276 (and e!715274 mapRes!49942))))

(declare-fun condMapEmpty!49942 () Bool)

(declare-fun mapDefault!49942 () ValueCell!15287)

