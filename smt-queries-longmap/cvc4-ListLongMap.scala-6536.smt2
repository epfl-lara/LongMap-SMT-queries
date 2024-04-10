; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83104 () Bool)

(assert start!83104)

(declare-fun mapIsEmpty!35002 () Bool)

(declare-fun mapRes!35002 () Bool)

(assert (=> mapIsEmpty!35002 mapRes!35002))

(declare-fun b!969404 () Bool)

(declare-fun e!546526 () Bool)

(declare-fun tp_is_empty!21995 () Bool)

(assert (=> b!969404 (= e!546526 tp_is_empty!21995)))

(declare-fun b!969405 () Bool)

(declare-fun e!546529 () Bool)

(assert (=> b!969405 (= e!546529 tp_is_empty!21995)))

(declare-fun b!969406 () Bool)

(declare-fun res!648838 () Bool)

(declare-fun e!546527 () Bool)

(assert (=> b!969406 (=> (not res!648838) (not e!546527))))

(declare-datatypes ((array!60055 0))(
  ( (array!60056 (arr!28891 (Array (_ BitVec 32) (_ BitVec 64))) (size!29370 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60055)

(declare-datatypes ((List!20026 0))(
  ( (Nil!20023) (Cons!20022 (h!21184 (_ BitVec 64)) (t!28389 List!20026)) )
))
(declare-fun arrayNoDuplicates!0 (array!60055 (_ BitVec 32) List!20026) Bool)

(assert (=> b!969406 (= res!648838 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20023))))

(declare-fun mapNonEmpty!35002 () Bool)

(declare-fun tp!66570 () Bool)

(assert (=> mapNonEmpty!35002 (= mapRes!35002 (and tp!66570 e!546526))))

(declare-datatypes ((V!34309 0))(
  ( (V!34310 (val!11048 Int)) )
))
(declare-datatypes ((ValueCell!10516 0))(
  ( (ValueCellFull!10516 (v!13607 V!34309)) (EmptyCell!10516) )
))
(declare-datatypes ((array!60057 0))(
  ( (array!60058 (arr!28892 (Array (_ BitVec 32) ValueCell!10516)) (size!29371 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60057)

(declare-fun mapValue!35002 () ValueCell!10516)

(declare-fun mapKey!35002 () (_ BitVec 32))

(declare-fun mapRest!35002 () (Array (_ BitVec 32) ValueCell!10516))

(assert (=> mapNonEmpty!35002 (= (arr!28892 _values!1425) (store mapRest!35002 mapKey!35002 mapValue!35002))))

(declare-fun b!969407 () Bool)

(declare-fun res!648840 () Bool)

(assert (=> b!969407 (=> (not res!648840) (not e!546527))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60055 (_ BitVec 32)) Bool)

(assert (=> b!969407 (= res!648840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969408 () Bool)

(declare-fun res!648839 () Bool)

(assert (=> b!969408 (=> (not res!648839) (not e!546527))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969408 (= res!648839 (and (= (size!29371 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29370 _keys!1717) (size!29371 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!648835 () Bool)

(assert (=> start!83104 (=> (not res!648835) (not e!546527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83104 (= res!648835 (validMask!0 mask!2147))))

(assert (=> start!83104 e!546527))

(assert (=> start!83104 true))

(declare-fun e!546525 () Bool)

(declare-fun array_inv!22367 (array!60057) Bool)

(assert (=> start!83104 (and (array_inv!22367 _values!1425) e!546525)))

(declare-fun array_inv!22368 (array!60055) Bool)

(assert (=> start!83104 (array_inv!22368 _keys!1717)))

(declare-fun b!969409 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!969409 (= e!546527 (or (bvslt from!2118 #b00000000000000000000000000000000) (bvsgt from!2118 (size!29370 _keys!1717))))))

(declare-fun b!969410 () Bool)

(declare-fun res!648837 () Bool)

(assert (=> b!969410 (=> (not res!648837) (not e!546527))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!969410 (= res!648837 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29370 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29370 _keys!1717))))))

(declare-fun b!969411 () Bool)

(declare-fun res!648836 () Bool)

(assert (=> b!969411 (=> (not res!648836) (not e!546527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969411 (= res!648836 (validKeyInArray!0 (select (arr!28891 _keys!1717) i!822)))))

(declare-fun b!969412 () Bool)

(assert (=> b!969412 (= e!546525 (and e!546529 mapRes!35002))))

(declare-fun condMapEmpty!35002 () Bool)

(declare-fun mapDefault!35002 () ValueCell!10516)

