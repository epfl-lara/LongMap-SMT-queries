; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82640 () Bool)

(assert start!82640)

(declare-fun b_free!18773 () Bool)

(declare-fun b_next!18773 () Bool)

(assert (=> start!82640 (= b_free!18773 (not b_next!18773))))

(declare-fun tp!65438 () Bool)

(declare-fun b_and!30261 () Bool)

(assert (=> start!82640 (= tp!65438 b_and!30261)))

(declare-fun b!963327 () Bool)

(declare-fun e!543183 () Bool)

(declare-fun tp_is_empty!21575 () Bool)

(assert (=> b!963327 (= e!543183 tp_is_empty!21575)))

(declare-fun b!963328 () Bool)

(declare-fun e!543182 () Bool)

(assert (=> b!963328 (= e!543182 tp_is_empty!21575)))

(declare-fun b!963329 () Bool)

(declare-fun res!644715 () Bool)

(declare-fun e!543184 () Bool)

(assert (=> b!963329 (=> (not res!644715) (not e!543184))))

(declare-datatypes ((array!59245 0))(
  ( (array!59246 (arr!28491 (Array (_ BitVec 32) (_ BitVec 64))) (size!28970 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59245)

(declare-datatypes ((List!19775 0))(
  ( (Nil!19772) (Cons!19771 (h!20933 (_ BitVec 64)) (t!28138 List!19775)) )
))
(declare-fun arrayNoDuplicates!0 (array!59245 (_ BitVec 32) List!19775) Bool)

(assert (=> b!963329 (= res!644715 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19772))))

(declare-fun res!644714 () Bool)

(assert (=> start!82640 (=> (not res!644714) (not e!543184))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82640 (= res!644714 (validMask!0 mask!2110))))

(assert (=> start!82640 e!543184))

(assert (=> start!82640 true))

(declare-datatypes ((V!33749 0))(
  ( (V!33750 (val!10838 Int)) )
))
(declare-datatypes ((ValueCell!10306 0))(
  ( (ValueCellFull!10306 (v!13396 V!33749)) (EmptyCell!10306) )
))
(declare-datatypes ((array!59247 0))(
  ( (array!59248 (arr!28492 (Array (_ BitVec 32) ValueCell!10306)) (size!28971 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59247)

(declare-fun e!543181 () Bool)

(declare-fun array_inv!22075 (array!59247) Bool)

(assert (=> start!82640 (and (array_inv!22075 _values!1400) e!543181)))

(declare-fun array_inv!22076 (array!59245) Bool)

(assert (=> start!82640 (array_inv!22076 _keys!1686)))

(assert (=> start!82640 tp!65438))

(assert (=> start!82640 tp_is_empty!21575))

(declare-fun b!963330 () Bool)

(declare-fun res!644717 () Bool)

(assert (=> b!963330 (=> (not res!644717) (not e!543184))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963330 (= res!644717 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28970 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28970 _keys!1686))))))

(declare-fun b!963331 () Bool)

(declare-fun res!644716 () Bool)

(assert (=> b!963331 (=> (not res!644716) (not e!543184))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!963331 (= res!644716 (and (= (size!28971 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28970 _keys!1686) (size!28971 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963332 () Bool)

(declare-fun mapRes!34357 () Bool)

(assert (=> b!963332 (= e!543181 (and e!543183 mapRes!34357))))

(declare-fun condMapEmpty!34357 () Bool)

(declare-fun mapDefault!34357 () ValueCell!10306)

