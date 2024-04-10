; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82736 () Bool)

(assert start!82736)

(declare-fun b_free!18869 () Bool)

(declare-fun b_next!18869 () Bool)

(assert (=> start!82736 (= b_free!18869 (not b_next!18869))))

(declare-fun tp!65726 () Bool)

(declare-fun b_and!30357 () Bool)

(assert (=> start!82736 (= tp!65726 b_and!30357)))

(declare-fun b!964976 () Bool)

(declare-fun res!645929 () Bool)

(declare-fun e!543986 () Bool)

(assert (=> b!964976 (=> (not res!645929) (not e!543986))))

(declare-datatypes ((array!59427 0))(
  ( (array!59428 (arr!28582 (Array (_ BitVec 32) (_ BitVec 64))) (size!29061 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59427)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964976 (= res!645929 (validKeyInArray!0 (select (arr!28582 _keys!1686) i!803)))))

(declare-fun b!964977 () Bool)

(declare-fun e!543984 () Bool)

(declare-fun tp_is_empty!21671 () Bool)

(assert (=> b!964977 (= e!543984 tp_is_empty!21671)))

(declare-fun b!964978 () Bool)

(declare-fun res!645930 () Bool)

(assert (=> b!964978 (=> (not res!645930) (not e!543986))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!964978 (= res!645930 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29061 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29061 _keys!1686))))))

(declare-fun b!964979 () Bool)

(declare-fun e!543983 () Bool)

(assert (=> b!964979 (= e!543983 tp_is_empty!21671)))

(declare-fun b!964980 () Bool)

(declare-fun res!645933 () Bool)

(assert (=> b!964980 (=> (not res!645933) (not e!543986))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33877 0))(
  ( (V!33878 (val!10886 Int)) )
))
(declare-datatypes ((ValueCell!10354 0))(
  ( (ValueCellFull!10354 (v!13444 V!33877)) (EmptyCell!10354) )
))
(declare-datatypes ((array!59429 0))(
  ( (array!59430 (arr!28583 (Array (_ BitVec 32) ValueCell!10354)) (size!29062 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59429)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!964980 (= res!645933 (and (= (size!29062 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29061 _keys!1686) (size!29062 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34501 () Bool)

(declare-fun mapRes!34501 () Bool)

(declare-fun tp!65727 () Bool)

(assert (=> mapNonEmpty!34501 (= mapRes!34501 (and tp!65727 e!543983))))

(declare-fun mapKey!34501 () (_ BitVec 32))

(declare-fun mapRest!34501 () (Array (_ BitVec 32) ValueCell!10354))

(declare-fun mapValue!34501 () ValueCell!10354)

(assert (=> mapNonEmpty!34501 (= (arr!28583 _values!1400) (store mapRest!34501 mapKey!34501 mapValue!34501))))

(declare-fun b!964981 () Bool)

(declare-fun res!645932 () Bool)

(assert (=> b!964981 (=> (not res!645932) (not e!543986))))

(declare-datatypes ((List!19839 0))(
  ( (Nil!19836) (Cons!19835 (h!20997 (_ BitVec 64)) (t!28202 List!19839)) )
))
(declare-fun arrayNoDuplicates!0 (array!59427 (_ BitVec 32) List!19839) Bool)

(assert (=> b!964981 (= res!645932 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19836))))

(declare-fun res!645934 () Bool)

(assert (=> start!82736 (=> (not res!645934) (not e!543986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82736 (= res!645934 (validMask!0 mask!2110))))

(assert (=> start!82736 e!543986))

(assert (=> start!82736 true))

(declare-fun e!543982 () Bool)

(declare-fun array_inv!22131 (array!59429) Bool)

(assert (=> start!82736 (and (array_inv!22131 _values!1400) e!543982)))

(declare-fun array_inv!22132 (array!59427) Bool)

(assert (=> start!82736 (array_inv!22132 _keys!1686)))

(assert (=> start!82736 tp!65726))

(assert (=> start!82736 tp_is_empty!21671))

(declare-fun b!964982 () Bool)

(declare-fun res!645931 () Bool)

(assert (=> b!964982 (=> (not res!645931) (not e!543986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59427 (_ BitVec 32)) Bool)

(assert (=> b!964982 (= res!645931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964983 () Bool)

(assert (=> b!964983 (= e!543982 (and e!543984 mapRes!34501))))

(declare-fun condMapEmpty!34501 () Bool)

(declare-fun mapDefault!34501 () ValueCell!10354)

