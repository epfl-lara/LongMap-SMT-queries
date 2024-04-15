; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104090 () Bool)

(assert start!104090)

(declare-fun b!1244841 () Bool)

(declare-fun res!830424 () Bool)

(declare-fun e!705694 () Bool)

(assert (=> b!1244841 (=> (not res!830424) (not e!705694))))

(declare-datatypes ((array!80021 0))(
  ( (array!80022 (arr!38600 (Array (_ BitVec 32) (_ BitVec 64))) (size!39138 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80021)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1244841 (= res!830424 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39138 a!3892)) (= newFrom!287 (size!39138 a!3892)) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1244842 () Bool)

(declare-fun res!830420 () Bool)

(assert (=> b!1244842 (=> (not res!830420) (not e!705694))))

(declare-datatypes ((List!27504 0))(
  ( (Nil!27501) (Cons!27500 (h!28709 (_ BitVec 64)) (t!40964 List!27504)) )
))
(declare-fun noDuplicate!2032 (List!27504) Bool)

(assert (=> b!1244842 (= res!830420 (noDuplicate!2032 Nil!27501))))

(declare-fun b!1244843 () Bool)

(declare-fun e!705695 () Bool)

(assert (=> b!1244843 (= e!705694 e!705695)))

(declare-fun res!830421 () Bool)

(assert (=> b!1244843 (=> res!830421 e!705695)))

(declare-fun contains!7407 (List!27504 (_ BitVec 64)) Bool)

(assert (=> b!1244843 (= res!830421 (contains!7407 Nil!27501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!830422 () Bool)

(assert (=> start!104090 (=> (not res!830422) (not e!705694))))

(assert (=> start!104090 (= res!830422 (and (bvslt (size!39138 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39138 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39138 a!3892))))))

(assert (=> start!104090 e!705694))

(declare-fun array_inv!29583 (array!80021) Bool)

(assert (=> start!104090 (array_inv!29583 a!3892)))

(assert (=> start!104090 true))

(declare-fun b!1244844 () Bool)

(assert (=> b!1244844 (= e!705695 (contains!7407 Nil!27501 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244845 () Bool)

(declare-fun res!830423 () Bool)

(assert (=> b!1244845 (=> (not res!830423) (not e!705694))))

(declare-fun arrayNoDuplicates!0 (array!80021 (_ BitVec 32) List!27504) Bool)

(assert (=> b!1244845 (= res!830423 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27501))))

(assert (= (and start!104090 res!830422) b!1244845))

(assert (= (and b!1244845 res!830423) b!1244841))

(assert (= (and b!1244841 res!830424) b!1244842))

(assert (= (and b!1244842 res!830420) b!1244843))

(assert (= (and b!1244843 (not res!830421)) b!1244844))

(declare-fun m!1146585 () Bool)

(assert (=> b!1244844 m!1146585))

(declare-fun m!1146587 () Bool)

(assert (=> b!1244843 m!1146587))

(declare-fun m!1146589 () Bool)

(assert (=> b!1244845 m!1146589))

(declare-fun m!1146591 () Bool)

(assert (=> b!1244842 m!1146591))

(declare-fun m!1146593 () Bool)

(assert (=> start!104090 m!1146593))

(check-sat (not b!1244844) (not start!104090) (not b!1244845) (not b!1244843) (not b!1244842))
(check-sat)
(get-model)

(declare-fun d!137125 () Bool)

(declare-fun lt!562673 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!612 (List!27504) (InoxSet (_ BitVec 64)))

(assert (=> d!137125 (= lt!562673 (select (content!612 Nil!27501) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!705724 () Bool)

(assert (=> d!137125 (= lt!562673 e!705724)))

(declare-fun res!830464 () Bool)

(assert (=> d!137125 (=> (not res!830464) (not e!705724))))

(get-info :version)

(assert (=> d!137125 (= res!830464 ((_ is Cons!27500) Nil!27501))))

(assert (=> d!137125 (= (contains!7407 Nil!27501 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562673)))

(declare-fun b!1244884 () Bool)

(declare-fun e!705726 () Bool)

(assert (=> b!1244884 (= e!705724 e!705726)))

(declare-fun res!830463 () Bool)

(assert (=> b!1244884 (=> res!830463 e!705726)))

(assert (=> b!1244884 (= res!830463 (= (h!28709 Nil!27501) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244886 () Bool)

(assert (=> b!1244886 (= e!705726 (contains!7407 (t!40964 Nil!27501) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137125 res!830464) b!1244884))

(assert (= (and b!1244884 (not res!830463)) b!1244886))

(declare-fun m!1146617 () Bool)

(assert (=> d!137125 m!1146617))

(declare-fun m!1146621 () Bool)

(assert (=> d!137125 m!1146621))

(declare-fun m!1146625 () Bool)

(assert (=> b!1244886 m!1146625))

(assert (=> b!1244844 d!137125))

(declare-fun b!1244924 () Bool)

(declare-fun e!705759 () Bool)

(declare-fun e!705757 () Bool)

(assert (=> b!1244924 (= e!705759 e!705757)))

(declare-fun c!121904 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244924 (= c!121904 (validKeyInArray!0 (select (arr!38600 a!3892) from!3270)))))

(declare-fun d!137131 () Bool)

(declare-fun res!830493 () Bool)

(declare-fun e!705758 () Bool)

(assert (=> d!137131 (=> res!830493 e!705758)))

(assert (=> d!137131 (= res!830493 (bvsge from!3270 (size!39138 a!3892)))))

(assert (=> d!137131 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27501) e!705758)))

(declare-fun b!1244925 () Bool)

(declare-fun e!705760 () Bool)

(assert (=> b!1244925 (= e!705760 (contains!7407 Nil!27501 (select (arr!38600 a!3892) from!3270)))))

(declare-fun b!1244926 () Bool)

(declare-fun call!61435 () Bool)

(assert (=> b!1244926 (= e!705757 call!61435)))

(declare-fun b!1244927 () Bool)

(assert (=> b!1244927 (= e!705758 e!705759)))

(declare-fun res!830491 () Bool)

(assert (=> b!1244927 (=> (not res!830491) (not e!705759))))

(assert (=> b!1244927 (= res!830491 (not e!705760))))

(declare-fun res!830492 () Bool)

(assert (=> b!1244927 (=> (not res!830492) (not e!705760))))

(assert (=> b!1244927 (= res!830492 (validKeyInArray!0 (select (arr!38600 a!3892) from!3270)))))

(declare-fun bm!61432 () Bool)

(assert (=> bm!61432 (= call!61435 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121904 (Cons!27500 (select (arr!38600 a!3892) from!3270) Nil!27501) Nil!27501)))))

(declare-fun b!1244928 () Bool)

(assert (=> b!1244928 (= e!705757 call!61435)))

(assert (= (and d!137131 (not res!830493)) b!1244927))

(assert (= (and b!1244927 res!830492) b!1244925))

(assert (= (and b!1244927 res!830491) b!1244924))

(assert (= (and b!1244924 c!121904) b!1244926))

(assert (= (and b!1244924 (not c!121904)) b!1244928))

(assert (= (or b!1244926 b!1244928) bm!61432))

(declare-fun m!1146632 () Bool)

(assert (=> b!1244924 m!1146632))

(assert (=> b!1244924 m!1146632))

(declare-fun m!1146635 () Bool)

(assert (=> b!1244924 m!1146635))

(assert (=> b!1244925 m!1146632))

(assert (=> b!1244925 m!1146632))

(declare-fun m!1146639 () Bool)

(assert (=> b!1244925 m!1146639))

(assert (=> b!1244927 m!1146632))

(assert (=> b!1244927 m!1146632))

(assert (=> b!1244927 m!1146635))

(assert (=> bm!61432 m!1146632))

(declare-fun m!1146645 () Bool)

(assert (=> bm!61432 m!1146645))

(assert (=> b!1244845 d!137131))

(declare-fun d!137137 () Bool)

(declare-fun res!830508 () Bool)

(declare-fun e!705778 () Bool)

(assert (=> d!137137 (=> res!830508 e!705778)))

(assert (=> d!137137 (= res!830508 ((_ is Nil!27501) Nil!27501))))

(assert (=> d!137137 (= (noDuplicate!2032 Nil!27501) e!705778)))

(declare-fun b!1244947 () Bool)

(declare-fun e!705780 () Bool)

(assert (=> b!1244947 (= e!705778 e!705780)))

(declare-fun res!830511 () Bool)

(assert (=> b!1244947 (=> (not res!830511) (not e!705780))))

(assert (=> b!1244947 (= res!830511 (not (contains!7407 (t!40964 Nil!27501) (h!28709 Nil!27501))))))

(declare-fun b!1244948 () Bool)

(assert (=> b!1244948 (= e!705780 (noDuplicate!2032 (t!40964 Nil!27501)))))

(assert (= (and d!137137 (not res!830508)) b!1244947))

(assert (= (and b!1244947 res!830511) b!1244948))

(declare-fun m!1146659 () Bool)

(assert (=> b!1244947 m!1146659))

(declare-fun m!1146661 () Bool)

(assert (=> b!1244948 m!1146661))

(assert (=> b!1244842 d!137137))

(declare-fun d!137145 () Bool)

(declare-fun lt!562676 () Bool)

(assert (=> d!137145 (= lt!562676 (select (content!612 Nil!27501) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!705781 () Bool)

(assert (=> d!137145 (= lt!562676 e!705781)))

(declare-fun res!830513 () Bool)

(assert (=> d!137145 (=> (not res!830513) (not e!705781))))

(assert (=> d!137145 (= res!830513 ((_ is Cons!27500) Nil!27501))))

(assert (=> d!137145 (= (contains!7407 Nil!27501 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562676)))

(declare-fun b!1244951 () Bool)

(declare-fun e!705782 () Bool)

(assert (=> b!1244951 (= e!705781 e!705782)))

(declare-fun res!830512 () Bool)

(assert (=> b!1244951 (=> res!830512 e!705782)))

(assert (=> b!1244951 (= res!830512 (= (h!28709 Nil!27501) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244952 () Bool)

(assert (=> b!1244952 (= e!705782 (contains!7407 (t!40964 Nil!27501) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137145 res!830513) b!1244951))

(assert (= (and b!1244951 (not res!830512)) b!1244952))

(assert (=> d!137145 m!1146617))

(declare-fun m!1146663 () Bool)

(assert (=> d!137145 m!1146663))

(declare-fun m!1146665 () Bool)

(assert (=> b!1244952 m!1146665))

(assert (=> b!1244843 d!137145))

(declare-fun d!137147 () Bool)

(assert (=> d!137147 (= (array_inv!29583 a!3892) (bvsge (size!39138 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104090 d!137147))

(check-sat (not b!1244947) (not b!1244924) (not b!1244948) (not b!1244952) (not d!137125) (not b!1244886) (not b!1244925) (not d!137145) (not bm!61432) (not b!1244927))
(check-sat)
