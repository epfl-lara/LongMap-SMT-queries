; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83206 () Bool)

(assert start!83206)

(declare-fun b_free!19199 () Bool)

(declare-fun b_next!19199 () Bool)

(assert (=> start!83206 (= b_free!19199 (not b_next!19199))))

(declare-fun tp!66875 () Bool)

(declare-fun b_and!30687 () Bool)

(assert (=> start!83206 (= tp!66875 b_and!30687)))

(declare-fun b!970790 () Bool)

(declare-fun res!649765 () Bool)

(declare-fun e!547293 () Bool)

(assert (=> b!970790 (=> (not res!649765) (not e!547293))))

(declare-datatypes ((array!60249 0))(
  ( (array!60250 (arr!28988 (Array (_ BitVec 32) (_ BitVec 64))) (size!29467 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60249)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970790 (= res!649765 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29467 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29467 _keys!1717))))))

(declare-fun b!970791 () Bool)

(declare-fun res!649762 () Bool)

(assert (=> b!970791 (=> (not res!649762) (not e!547293))))

(declare-datatypes ((List!20094 0))(
  ( (Nil!20091) (Cons!20090 (h!21252 (_ BitVec 64)) (t!28457 List!20094)) )
))
(declare-fun arrayNoDuplicates!0 (array!60249 (_ BitVec 32) List!20094) Bool)

(assert (=> b!970791 (= res!649762 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20091))))

(declare-fun b!970792 () Bool)

(declare-fun e!547290 () Bool)

(declare-fun tp_is_empty!22097 () Bool)

(assert (=> b!970792 (= e!547290 tp_is_empty!22097)))

(declare-fun mapNonEmpty!35155 () Bool)

(declare-fun mapRes!35155 () Bool)

(declare-fun tp!66876 () Bool)

(assert (=> mapNonEmpty!35155 (= mapRes!35155 (and tp!66876 e!547290))))

(declare-datatypes ((V!34445 0))(
  ( (V!34446 (val!11099 Int)) )
))
(declare-datatypes ((ValueCell!10567 0))(
  ( (ValueCellFull!10567 (v!13658 V!34445)) (EmptyCell!10567) )
))
(declare-fun mapValue!35155 () ValueCell!10567)

(declare-datatypes ((array!60251 0))(
  ( (array!60252 (arr!28989 (Array (_ BitVec 32) ValueCell!10567)) (size!29468 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60251)

(declare-fun mapKey!35155 () (_ BitVec 32))

(declare-fun mapRest!35155 () (Array (_ BitVec 32) ValueCell!10567))

(assert (=> mapNonEmpty!35155 (= (arr!28989 _values!1425) (store mapRest!35155 mapKey!35155 mapValue!35155))))

(declare-fun b!970794 () Bool)

(declare-fun res!649767 () Bool)

(assert (=> b!970794 (=> (not res!649767) (not e!547293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970794 (= res!649767 (validKeyInArray!0 (select (arr!28988 _keys!1717) i!822)))))

(declare-fun b!970795 () Bool)

(declare-fun e!547294 () Bool)

(assert (=> b!970795 (= e!547294 tp_is_empty!22097)))

(declare-fun b!970793 () Bool)

(declare-fun res!649764 () Bool)

(assert (=> b!970793 (=> (not res!649764) (not e!547293))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970793 (= res!649764 (and (= (size!29468 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29467 _keys!1717) (size!29468 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!649763 () Bool)

(assert (=> start!83206 (=> (not res!649763) (not e!547293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83206 (= res!649763 (validMask!0 mask!2147))))

(assert (=> start!83206 e!547293))

(assert (=> start!83206 true))

(declare-fun e!547292 () Bool)

(declare-fun array_inv!22435 (array!60251) Bool)

(assert (=> start!83206 (and (array_inv!22435 _values!1425) e!547292)))

(assert (=> start!83206 tp_is_empty!22097))

(assert (=> start!83206 tp!66875))

(declare-fun array_inv!22436 (array!60249) Bool)

(assert (=> start!83206 (array_inv!22436 _keys!1717)))

(declare-fun b!970796 () Bool)

(assert (=> b!970796 (= e!547292 (and e!547294 mapRes!35155))))

(declare-fun condMapEmpty!35155 () Bool)

(declare-fun mapDefault!35155 () ValueCell!10567)

