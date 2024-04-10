; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82188 () Bool)

(assert start!82188)

(declare-fun b_free!18461 () Bool)

(declare-fun b_next!18461 () Bool)

(assert (=> start!82188 (= b_free!18461 (not b_next!18461))))

(declare-fun tp!64344 () Bool)

(declare-fun b_and!29949 () Bool)

(assert (=> start!82188 (= tp!64344 b_and!29949)))

(declare-fun b!957902 () Bool)

(declare-fun res!641190 () Bool)

(declare-fun e!540030 () Bool)

(assert (=> b!957902 (=> (not res!641190) (not e!540030))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58437 0))(
  ( (array!58438 (arr!28092 (Array (_ BitVec 32) (_ BitVec 64))) (size!28571 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58437)

(declare-datatypes ((V!33205 0))(
  ( (V!33206 (val!10634 Int)) )
))
(declare-datatypes ((ValueCell!10102 0))(
  ( (ValueCellFull!10102 (v!13191 V!33205)) (EmptyCell!10102) )
))
(declare-datatypes ((array!58439 0))(
  ( (array!58440 (arr!28093 (Array (_ BitVec 32) ValueCell!10102)) (size!28572 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58439)

(assert (=> b!957902 (= res!641190 (and (= (size!28572 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28571 _keys!1668) (size!28572 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!641189 () Bool)

(assert (=> start!82188 (=> (not res!641189) (not e!540030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82188 (= res!641189 (validMask!0 mask!2088))))

(assert (=> start!82188 e!540030))

(assert (=> start!82188 true))

(declare-fun tp_is_empty!21167 () Bool)

(assert (=> start!82188 tp_is_empty!21167))

(declare-fun array_inv!21789 (array!58437) Bool)

(assert (=> start!82188 (array_inv!21789 _keys!1668)))

(declare-fun e!540026 () Bool)

(declare-fun array_inv!21790 (array!58439) Bool)

(assert (=> start!82188 (and (array_inv!21790 _values!1386) e!540026)))

(assert (=> start!82188 tp!64344))

(declare-fun b!957903 () Bool)

(declare-fun res!641187 () Bool)

(assert (=> b!957903 (=> (not res!641187) (not e!540030))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957903 (= res!641187 (validKeyInArray!0 (select (arr!28092 _keys!1668) i!793)))))

(declare-fun b!957904 () Bool)

(declare-fun res!641192 () Bool)

(assert (=> b!957904 (=> (not res!641192) (not e!540030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58437 (_ BitVec 32)) Bool)

(assert (=> b!957904 (= res!641192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33730 () Bool)

(declare-fun mapRes!33730 () Bool)

(assert (=> mapIsEmpty!33730 mapRes!33730))

(declare-fun b!957905 () Bool)

(declare-fun e!540029 () Bool)

(assert (=> b!957905 (= e!540026 (and e!540029 mapRes!33730))))

(declare-fun condMapEmpty!33730 () Bool)

(declare-fun mapDefault!33730 () ValueCell!10102)

