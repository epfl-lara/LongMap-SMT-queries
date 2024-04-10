; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35814 () Bool)

(assert start!35814)

(declare-fun b!359754 () Bool)

(declare-fun e!220380 () Bool)

(declare-fun tp_is_empty!8267 () Bool)

(assert (=> b!359754 (= e!220380 tp_is_empty!8267)))

(declare-fun b!359755 () Bool)

(declare-fun e!220381 () Bool)

(assert (=> b!359755 (= e!220381 (not true))))

(declare-datatypes ((array!20087 0))(
  ( (array!20088 (arr!9537 (Array (_ BitVec 32) (_ BitVec 64))) (size!9889 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20087)

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359755 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11999 0))(
  ( (V!12000 (val!4178 Int)) )
))
(declare-fun minValue!1150 () V!11999)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!11058 0))(
  ( (Unit!11059) )
))
(declare-fun lt!166388 () Unit!11058)

(declare-datatypes ((ValueCell!3790 0))(
  ( (ValueCellFull!3790 (v!6372 V!11999)) (EmptyCell!3790) )
))
(declare-datatypes ((array!20089 0))(
  ( (array!20090 (arr!9538 (Array (_ BitVec 32) ValueCell!3790)) (size!9890 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20089)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11999)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!44 (array!20087 array!20089 (_ BitVec 32) (_ BitVec 32) V!11999 V!11999 (_ BitVec 64) (_ BitVec 32)) Unit!11058)

(assert (=> b!359755 (= lt!166388 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!44 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!359756 () Bool)

(declare-fun res!199959 () Bool)

(assert (=> b!359756 (=> (not res!199959) (not e!220381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20087 (_ BitVec 32)) Bool)

(assert (=> b!359756 (= res!199959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359757 () Bool)

(declare-fun res!199958 () Bool)

(assert (=> b!359757 (=> (not res!199958) (not e!220381))))

(declare-datatypes ((List!5478 0))(
  ( (Nil!5475) (Cons!5474 (h!6330 (_ BitVec 64)) (t!10628 List!5478)) )
))
(declare-fun arrayNoDuplicates!0 (array!20087 (_ BitVec 32) List!5478) Bool)

(assert (=> b!359757 (= res!199958 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5475))))

(declare-fun mapIsEmpty!13908 () Bool)

(declare-fun mapRes!13908 () Bool)

(assert (=> mapIsEmpty!13908 mapRes!13908))

(declare-fun b!359758 () Bool)

(declare-fun res!199957 () Bool)

(assert (=> b!359758 (=> (not res!199957) (not e!220381))))

(assert (=> b!359758 (= res!199957 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9889 _keys!1456))))))

(declare-fun res!199963 () Bool)

(assert (=> start!35814 (=> (not res!199963) (not e!220381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35814 (= res!199963 (validMask!0 mask!1842))))

(assert (=> start!35814 e!220381))

(assert (=> start!35814 tp_is_empty!8267))

(assert (=> start!35814 true))

(declare-fun array_inv!7014 (array!20087) Bool)

(assert (=> start!35814 (array_inv!7014 _keys!1456)))

(declare-fun e!220382 () Bool)

(declare-fun array_inv!7015 (array!20089) Bool)

(assert (=> start!35814 (and (array_inv!7015 _values!1208) e!220382)))

(declare-fun b!359759 () Bool)

(declare-fun res!199960 () Bool)

(assert (=> b!359759 (=> (not res!199960) (not e!220381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359759 (= res!199960 (validKeyInArray!0 k!1077))))

(declare-fun b!359760 () Bool)

(declare-fun res!199961 () Bool)

(assert (=> b!359760 (=> (not res!199961) (not e!220381))))

(assert (=> b!359760 (= res!199961 (and (= (size!9890 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9889 _keys!1456) (size!9890 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359761 () Bool)

(declare-fun e!220379 () Bool)

(assert (=> b!359761 (= e!220379 tp_is_empty!8267)))

(declare-fun b!359762 () Bool)

(declare-fun res!199962 () Bool)

(assert (=> b!359762 (=> (not res!199962) (not e!220381))))

(assert (=> b!359762 (= res!199962 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!359763 () Bool)

(declare-fun res!199956 () Bool)

(assert (=> b!359763 (=> (not res!199956) (not e!220381))))

(assert (=> b!359763 (= res!199956 (not (= (select (arr!9537 _keys!1456) from!1805) k!1077)))))

(declare-fun mapNonEmpty!13908 () Bool)

(declare-fun tp!27975 () Bool)

(assert (=> mapNonEmpty!13908 (= mapRes!13908 (and tp!27975 e!220380))))

(declare-fun mapRest!13908 () (Array (_ BitVec 32) ValueCell!3790))

(declare-fun mapValue!13908 () ValueCell!3790)

(declare-fun mapKey!13908 () (_ BitVec 32))

(assert (=> mapNonEmpty!13908 (= (arr!9538 _values!1208) (store mapRest!13908 mapKey!13908 mapValue!13908))))

(declare-fun b!359764 () Bool)

(assert (=> b!359764 (= e!220382 (and e!220379 mapRes!13908))))

(declare-fun condMapEmpty!13908 () Bool)

(declare-fun mapDefault!13908 () ValueCell!3790)

